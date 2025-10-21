import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_flutter_app/data/models/rocket_model.dart';

// Cache manager specifically for rocket data
class RocketCacheManager {
  static final RocketCacheManager _instance = RocketCacheManager._internal();
  factory RocketCacheManager() => _instance;

  RocketCacheManager._internal();

  static const String allRocketsKey = 'all_rockets_cache';
  // Using the same cache duration as the other managers for consistency
  static const Duration cacheDuration = Duration(hours: 24);

  /// Caches a list of raw Rocket JSON maps.
  Future<void> cacheRocketsJson(List<Map<String, dynamic>> rocketsJson) async {
    await _cacheJsonData(allRocketsKey, rocketsJson);
  }

  /// Retrieves cached rockets and checks for expiration.
  Future<List<RocketModel>?> getCachedRockets() async {
    final jsonData = await _getCachedJsonData(allRocketsKey);
    if (jsonData == null) return null;
    // Map raw JSON to RocketModel
    return jsonData.map((json) => RocketModel.fromJson(json)).toList();
  }

  /// Internal method to store JSON data with a timestamp.
  Future<void> _cacheJsonData(
      String key, List<Map<String, dynamic>> data) async {
    final prefs = await SharedPreferences.getInstance();
    final cacheData = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    await prefs.setString(key, jsonEncode(cacheData));
  }

  /// Internal method to retrieve JSON data and check cache validity.
  Future<List<Map<String, dynamic>>?> _getCachedJsonData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedString = prefs.getString(key);

    if (cachedString == null) return null;

    try {
      final cacheData = jsonDecode(cachedString) as Map<String, dynamic>;
      final timestamp = cacheData['timestamp'] as int;
      final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

      // Check cache expiration
      if (DateTime.now().difference(cacheTime) > cacheDuration) {
        await prefs.remove(key);
        return null;
      }

      final data = cacheData['data'] as List<dynamic>;
      return data.cast<Map<String, dynamic>>();
    } catch (e) {
      // Clear cache if parsing error occurs
      await prefs.remove(key);
      return null;
    }
  }

  /// Clears the rocket cache.
  Future<void> clearRocketCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(allRocketsKey);
  }
}
