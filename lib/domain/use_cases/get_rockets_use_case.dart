import 'package:flutter/foundation.dart';
import 'package:spacex_flutter_app/core/cache/rocket_cache_manager.dart';
import 'package:spacex_flutter_app/core/network/connectivity_manager.dart';
import 'package:spacex_flutter_app/data/models/rocket_model.dart';
import 'package:spacex_flutter_app/data/queries/rocket_queries.dart';
import 'package:spacex_flutter_app/data/repositories/graphql_repository_impl.dart';
import 'package:spacex_flutter_app/domain/repositories/i_rocket_repository.dart';

class GetRocketsUseCase implements IRocketRepository {
  final GraphQLRepositoryImpl repository;
  final RocketCacheManager cacheManager;
  final ConnectivityManager connectivityManager;

  // UPDATED: Constructor now requires cache and connectivity managers
  GetRocketsUseCase(
      this.repository, this.cacheManager, this.connectivityManager);

  /// Helper function to apply client-side pagination to a list of cached models
  List<RocketModel> _applyPaginationToCache(
      List<RocketModel> cachedList, int limit, int offset) {
    if (offset >= cachedList.length) {
      return [];
    }
    final endIndex = (offset + limit).clamp(0, cachedList.length);
    final startIndex = offset.clamp(0, cachedList.length);

    return cachedList.sublist(startIndex, endIndex);
  }

  @override
  Future<List<RocketModel>> getRockets({
    required int limit,
    required int offset,
  }) async {
    final variables = {
      'limit': limit,
      'offset': offset,
    };

    final hasConnection = await connectivityManager.checkConnectivity();

    // 1. Try to fetch from cache if offline
    if (!hasConnection) {
      final cachedRockets =
          await cacheManager.getCachedRockets(); // List<RocketModel>?

      if (cachedRockets != null && cachedRockets.isNotEmpty) {
        if (kDebugMode)
          print('Returning paginated Rockets from cache (offline).');
        return _applyPaginationToCache(cachedRockets, limit, offset);
      }
      throw Exception(
          'No internet connection and no cached rocket data available');
    }

    try {
      // 2. Fetch from network
      final rawDataList = await repository.executeListQuery(
        query: getAllRocketsQuery,
        queryName: 'rockets',
        variables: variables,
      );

      // Map raw data to models (for caching)
      final newRocketModels =
          rawDataList.map((rawMap) => RocketModel.fromJson(rawMap)).toList();

      // 3. Cache the results if we are fetching the first page (offset == 0)
      if (offset == 0) {
        final existingCacheModels = await cacheManager.getCachedRockets();

        if (newRocketModels.isNotEmpty) {
          // Use a Map to combine existing and new models, ensuring uniqueness by ID
          final Map<String, RocketModel> uniqueModelsMap = {};

          // Add existing models to the map
          if (existingCacheModels != null) {
            for (var model in existingCacheModels) {
              // Ensure we have an ID to use as key
              if (model.id != null) {
                uniqueModelsMap[model.id!] = model;
              }
            }
          }

          // Add new models (will overwrite old ones if IDs match)
          for (var model in newRocketModels) {
            if (model.id != null) {
              uniqueModelsMap[model.id!] = model;
            }
          }

          final modelsToCache = uniqueModelsMap.values.toList();

          // Convert models back to JSON (Map<String, dynamic>) for cache manager
          // toJson() is available because RocketModel is a Freezed class.
          final uniqueJson =
              modelsToCache.map((model) => model.toJson()).toList();
          await cacheManager.cacheRocketsJson(uniqueJson);
        }
      }

      // Return Models
      return newRocketModels;
    } catch (e) {
      // 4. Network failure fallback to cache
      if (kDebugMode)
        print('Network error in getRockets. Falling back to cache: $e');
      final cachedRockets = await cacheManager.getCachedRockets();

      if (cachedRockets != null && cachedRockets.isNotEmpty) {
        if (kDebugMode)
          print('Returning paginated Rockets from cache after network fail.');
        return _applyPaginationToCache(cachedRockets, limit, offset);
      }

      // If cache is also empty, rethrow a standard Exception
      throw Exception('Failed to load rockets: ${e.toString()}');
    }
  }
}
