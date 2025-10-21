import 'package:flutter/foundation.dart';
import 'package:spacex_flutter_app/core/cache/capsule_cache_manager.dart';
import 'package:spacex_flutter_app/core/network/connectivity_manager.dart';
import 'package:spacex_flutter_app/data/models/capsule_model.dart';
import 'package:spacex_flutter_app/data/queries/capsule_queries.dart';
import 'package:spacex_flutter_app/data/repositories/graphql_repository_impl.dart';
import 'package:spacex_flutter_app/domain/repositories/i_capsule_repository.dart';

// This implementation now handles connectivity, caching, and fallback logic.
class GetCapsulesUseCase implements ICapsuleRepository {
  final GraphQLRepositoryImpl repository;
  final CapsuleCacheManager cacheManager;
  final ConnectivityManager connectivityManager;

  // UPDATED: Constructor now requires cache and connectivity managers
  GetCapsulesUseCase(
      this.repository, this.cacheManager, this.connectivityManager);

  /// Helper function to apply client-side pagination to a list of cached models
  List<CapsuleModel> _applyPaginationToCache(
      List<CapsuleModel> cachedList, int limit, int offset) {
    if (offset >= cachedList.length) {
      return [];
    }
    final endIndex = (offset + limit).clamp(0, cachedList.length);
    final startIndex = offset.clamp(0, cachedList.length);

    return cachedList.sublist(startIndex, endIndex);
  }

  @override
  Future<List<CapsuleModel>> getCapsules({
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
      final cachedCapsules =
          await cacheManager.getCachedCapsules(); // List<CapsuleModel>?

      if (cachedCapsules != null && cachedCapsules.isNotEmpty) {
        if (kDebugMode)
          print('Returning paginated Capsules from cache (offline).');
        return _applyPaginationToCache(cachedCapsules, limit, offset);
      }
      throw Exception(
          'No internet connection and no cached capsule data available');
    }

    try {
      // 2. Fetch from network
      final rawDataList = await repository.executeListQuery(
        query: getAllCapsulesQuery,
        queryName: 'capsules',
        variables: variables,
      );

      // Map raw data to models (for caching)
      final newCapsuleModels =
          rawDataList.map((rawMap) => CapsuleModel.fromJson(rawMap)).toList();

      // 3. Cache the results if we are fetching the first page (offset == 0)
      if (offset == 0) {
        final existingCacheModels = await cacheManager.getCachedCapsules();

        if (newCapsuleModels.isNotEmpty) {
          // Use a Map to combine existing and new models, ensuring uniqueness by ID
          final Map<String, CapsuleModel> uniqueModelsMap = {};

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
          for (var model in newCapsuleModels) {
            if (model.id != null) {
              uniqueModelsMap[model.id!] = model;
            }
          }

          final modelsToCache = uniqueModelsMap.values.toList();

          // Convert models back to JSON (Map<String, dynamic>) for cache manager
          // toJson() is available because CapsuleModel is a Freezed class.
          final uniqueJson =
              modelsToCache.map((model) => model.toJson()).toList();
          await cacheManager.cacheCapsulesJson(uniqueJson);
        }
      }

      // Return Models
      return newCapsuleModels;
    } catch (e) {
      // 4. Network failure fallback to cache
      if (kDebugMode)
        print('Network error in getCapsules. Falling back to cache: $e');
      final cachedCapsules = await cacheManager.getCachedCapsules();

      if (cachedCapsules != null && cachedCapsules.isNotEmpty) {
        if (kDebugMode)
          print('Returning paginated Capsules from cache after network fail.');
        return _applyPaginationToCache(cachedCapsules, limit, offset);
      }

      // If cache is also empty, rethrow a standard Exception
      throw Exception('Failed to load capsules: ${e.toString()}');
    }
  }

  @override
  Future<CapsuleModel> geCapsuleDetails(String id) async {
    final variables = {
      'capsuleId': id,
    };

    // Details fetch remains network-only as per the pattern established in Launch use case.
    final hasConnection = await connectivityManager.checkConnectivity();
    if (!hasConnection) {
      throw Exception(
          'No internet connection available to fetch capsule details.');
    }

    try {
      final rawData = await repository.executeSingleQuery(
        query: getCapsuleDetailsQuery,
        queryName: 'capsule',
        variables: variables,
      );

      // This is where the mapping happens: from raw API data (Map) to Model.
      return CapsuleModel.fromJson(rawData);
    } catch (e) {
      throw Exception(
          'Failed to fetch capsule details for ID $id: ${e.toString()}');
    }
  }
}
