import 'package:flutter/foundation.dart';
import 'package:spacex_flutter_app/core/cache/launch_cache_manager.dart';
import 'package:spacex_flutter_app/core/network/connectivity_manager.dart';
import 'package:spacex_flutter_app/data/models/launch_model.dart';
import 'package:spacex_flutter_app/data/queries/launch_queries.dart';
import 'package:spacex_flutter_app/data/repositories/graphql_repository_impl.dart';
import 'package:spacex_flutter_app/domain/entities/launch_entity.dart';
import 'package:spacex_flutter_app/domain/repositories/i_launch_repository.dart';

// In Clean Architecture, this class should ideally be a pure Use Case (interactor)
// that depends on an abstract ILaunchRepository (implemented in data layer).
// Since it implements ILaunchRepository and contains network/cache logic, it acts
// as both the Repository Implementation and the Use Case layer, similar to the
// structure seen in the Capsule benchmark.

class GetLaunchesUseCase implements ILaunchRepository {
  final GraphQLRepositoryImpl repository;
  final LaunchCacheManager cacheManager;
  final ConnectivityManager connectivityManager;

  GetLaunchesUseCase(
    this.repository,
    this.cacheManager,
    this.connectivityManager,
  );

  /// Helper function to apply client-side pagination to a list of cached entities
  List<LaunchEntity> _applyPaginationToCache(
      List<LaunchEntity> cachedList, int limit, int offset) {
    // This assumes the cached list is already correctly sorted.
    if (offset >= cachedList.length) {
      return [];
    }
    final endIndex = (offset + limit).clamp(0, cachedList.length);
    final startIndex = offset.clamp(0, cachedList.length);

    return cachedList.sublist(startIndex, endIndex);
  }

  /// Fetches past launches from the network or cache.
  @override
  Future<List<LaunchEntity>> getPastLaunches({
    required int limit,
    required int offset,
    required String missionName,
  }) async {
    final variables = {
      'limit': limit,
      'offset': offset,
      'mission_name': missionName,
    };

    final hasConnection = await connectivityManager.checkConnectivity();

    // 1. Try to fetch from cache if offline or using a filter
    if (!hasConnection || missionName.isNotEmpty) {
      final cachedLaunches =
          await cacheManager.getCachedPastLaunches(); // List<LaunchModel>?

      if (cachedLaunches != null && cachedLaunches.isNotEmpty) {
        // Convert Models to Entities for filtering and domain use
        final cachedEntities = cachedLaunches.map((m) => m.toEntity()).toList();

        // Apply mission name filter
        final filteredList = cachedEntities.where((launch) {
          final name = launch.missionName.toLowerCase();
          return name.contains(missionName.toLowerCase());
        }).toList();

        if (kDebugMode)
          print('Returning filtered/paginated Past Launches from cache.');
        return _applyPaginationToCache(filteredList, limit, offset);
      }

      if (!hasConnection) {
        throw Exception(
            'No internet connection and no cached past launch data available');
      }
    }

    try {
      // 2. Fetch from network
      final rawDataList = await repository.executeListQuery(
        query: getPastLaunchesQuery,
        queryName: 'launchesPast',
        variables: variables,
      );

      // Map raw data to models (for caching)
      final newLaunchModels =
          rawDataList.map((rawMap) => LaunchModel.fromJson(rawMap)).toList();

      // 3. Cache the results if we are fetching the first page without a filter
      if (offset == 0 && missionName.isEmpty) {
        final existingCacheModels = await cacheManager.getCachedPastLaunches();

        if (newLaunchModels.isNotEmpty) {
          // Use a Map to combine existing and new models, ensuring uniqueness by ID
          final Map<String, LaunchModel> uniqueModelsMap = {};

          if (existingCacheModels != null) {
            for (var model in existingCacheModels) {
              uniqueModelsMap[model.id] = model;
            }
          }

          for (var model in newLaunchModels) {
            uniqueModelsMap[model.id] =
                model; // Overwrite with newer data if ID matches
          }

          final modelsToCache = uniqueModelsMap.values.toList();

          // Convert models back to JSON (Map<String, dynamic>) for cache manager
          final uniqueJson =
              modelsToCache.map((model) => model.toJson()).toList();
          await cacheManager.cachePastLaunchesJson(uniqueJson);
        }
      }

      // Return Entities
      return newLaunchModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      // 4. Network failure fallback to cache
      if (kDebugMode)
        print('Network error in getPastLaunches. Falling back to cache: $e');
      final cachedLaunches = await cacheManager.getCachedPastLaunches();

      if (cachedLaunches != null && cachedLaunches.isNotEmpty) {
        // Convert Models to Entities for filtering and domain use
        final cachedEntities = cachedLaunches.map((m) => m.toEntity()).toList();

        // Apply mission name filter
        final filteredList = cachedEntities.where((launch) {
          final name = launch.missionName.toLowerCase();
          return name.contains(missionName.toLowerCase());
        }).toList();

        if (kDebugMode)
          print(
              'Returning filtered/paginated Past Launches from cache after network fail.');
        return _applyPaginationToCache(filteredList, limit, offset);
      }

      // If cache is also empty, rethrow a standard network error
      throw Exception('Failed to load past launches: ${e.toString()}');
    }
  }

  /// Fetches upcoming launches from the network or cache.
  @override
  Future<List<LaunchEntity>> getUpComingLaunches(
      {required int limit, required int offset}) async {
    final variables = {
      'limit': limit,
      'offset': offset,
    };

    final hasConnection = await connectivityManager.checkConnectivity();

    // 1. Try to fetch from cache if offline
    if (!hasConnection) {
      final cachedLaunches =
          await cacheManager.getCachedUpcomingLaunches(); // List<LaunchModel>?

      if (cachedLaunches != null && cachedLaunches.isNotEmpty) {
        // Convert Models to Entities for domain use
        final cachedEntities = cachedLaunches.map((m) => m.toEntity()).toList();
        if (kDebugMode)
          print('Returning paginated Upcoming Launches from cache.');
        return _applyPaginationToCache(cachedEntities, limit, offset);
      }
      throw Exception(
          'No internet connection and no cached upcoming launch data available');
    }

    try {
      // 2. Fetch from network
      final rawDataList = await repository.executeListQuery(
        query: getUpComingLaunchesQuery,
        queryName: 'launchesUpcoming',
        variables: variables,
      );

      // Map raw data to models (for caching)
      final newLaunchModels =
          rawDataList.map((rawMap) => LaunchModel.fromJson(rawMap)).toList();

      // 3. Cache the results if we are fetching the first page
      if (offset == 0) {
        final existingCacheModels =
            await cacheManager.getCachedUpcomingLaunches();

        if (newLaunchModels.isNotEmpty) {
          // Use a Map to combine existing and new models, ensuring uniqueness by ID
          final Map<String, LaunchModel> uniqueModelsMap = {};

          if (existingCacheModels != null) {
            for (var model in existingCacheModels) {
              uniqueModelsMap[model.id] = model;
            }
          }

          for (var model in newLaunchModels) {
            uniqueModelsMap[model.id] =
                model; // Overwrite with newer data if ID matches
          }

          final modelsToCache = uniqueModelsMap.values.toList();

          // Convert models back to JSON (Map<String, dynamic>) for cache manager
          final uniqueJson =
              modelsToCache.map((model) => model.toJson()).toList();
          await cacheManager.cacheUpcomingLaunchesJson(uniqueJson);
        }
      }

      // Return Entities
      return newLaunchModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      // 4. Network failure fallback to cache
      if (kDebugMode)
        print(
            'Network error in getUpComingLaunches. Falling back to cache: $e');
      final cachedLaunches = await cacheManager.getCachedUpcomingLaunches();

      if (cachedLaunches != null && cachedLaunches.isNotEmpty) {
        // Convert Models to Entities for domain use
        final cachedEntities = cachedLaunches.map((m) => m.toEntity()).toList();
        if (kDebugMode)
          print(
              'Returning paginated Upcoming Launches from cache after network fail.');
        return _applyPaginationToCache(cachedEntities, limit, offset);
      }

      // If cache is also empty, rethrow a standard network error
      throw Exception('Failed to load upcoming launches: ${e.toString()}');
    }
  }

  /// Fetches launch details by ID from the network only.
  @override
  Future<LaunchEntity> getLaunchDetails(String id) async {
    final variables = {
      'id': id,
    };

    // Connectivity check and caching logic removed as requested.

    try {
      // Fetch from network
      final rawData = await repository.executeSingleQuery(
        query: getLaunchDetailsQuery,
        queryName: 'launch',
        variables: variables,
      );

      // Map raw data to entity
      return LaunchModel.fromJson(rawData).toEntity();
    } catch (e) {
      // Rethrow a generic Exception if fetching fails
      throw Exception(
          'Failed to fetch launch details for ID $id: ${e.toString()}');
    }
  }
}
