import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_flutter_app/data/models/capsule_model.dart';

// Cache manager specifically for capsule data
class CapsuleCacheManager {
  static final CapsuleCacheManager _instance = CapsuleCacheManager._internal();
  factory CapsuleCacheManager() => _instance;

  CapsuleCacheManager._internal();

  static const String allCapsulesKey = 'all_capsules_cache';
  // Using the same cache duration as the launch manager for consistency
  static const Duration cacheDuration = Duration(hours: 24);

  /// Caches a list of raw Capsule JSON maps.
  Future<void> cacheCapsulesJson(
      List<Map<String, dynamic>> capsulesJson) async {
    await _cacheJsonData(allCapsulesKey, capsulesJson);
  }

  /// Retrieves cached capsules and checks for expiration.
  Future<List<CapsuleModel>?> getCachedCapsules() async {
    final jsonData = await _getCachedJsonData(allCapsulesKey);
    if (jsonData == null) return null;
    // Map raw JSON to CapsuleModel
    return jsonData.map((json) => CapsuleModel.fromJson(json)).toList();
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

  /// Clears the capsule cache.
  Future<void> clearCapsuleCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(allCapsulesKey);
  }
}
