import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_flutter_app/data/models/launch_model.dart';

// Cache manager specifically for launch data with 1-hour cache duration
class LaunchCacheManager {
  static final LaunchCacheManager _instance = LaunchCacheManager._internal();
  factory LaunchCacheManager() => _instance;
  
  LaunchCacheManager._internal();

  static const String upcomingKey = 'upcoming_launches_cache';
  static const String pastKey = 'past_launches_cache';
  static const Duration cacheDuration = Duration(hours: 24);


  Future<void> cacheUpcomingLaunchesJson(List<Map<String, dynamic>> launchesJson) async {
    await _cacheJsonData(upcomingKey, launchesJson);
  }

  Future<List<LaunchModel>?> getCachedUpcomingLaunches() async {
    final jsonData = await _getCachedJsonData(upcomingKey);
    if (jsonData == null) return null;
    return jsonData.map((json) => LaunchModel.fromJson(json)).toList();
  }

  Future<void> cachePastLaunchesJson(List<Map<String, dynamic>> launchesJson) async {
    await _cacheJsonData(pastKey, launchesJson);
  }

  Future<List<LaunchModel>?> getCachedPastLaunches() async {
    final jsonData = await _getCachedJsonData(pastKey);
    if (jsonData == null) return null;
    return jsonData.map((json) => LaunchModel.fromJson(json)).toList();
  }

  Future<void> _cacheJsonData(String key, List<Map<String, dynamic>> data) async {
    final prefs = await SharedPreferences.getInstance();
    final cacheData = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    await prefs.setString(key, jsonEncode(cacheData));
  }

  Future<List<Map<String, dynamic>>?> _getCachedJsonData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedString = prefs.getString(key);
    
    if (cachedString == null) return null;

    try {
      final cacheData = jsonDecode(cachedString) as Map<String, dynamic>;
      final timestamp = cacheData['timestamp'] as int;
      final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      
      if (DateTime.now().difference(cacheTime) > cacheDuration) {
        await prefs.remove(key);
        return null;
      }

      final data = cacheData['data'] as List<dynamic>;
      return data.cast<Map<String, dynamic>>();
    } catch (e) {
      await prefs.remove(key);
      return null;
    }
  }

  Future<bool> isCacheValid(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedString = prefs.getString(key);
    
    if (cachedString == null) return false;

    try {
      final cacheData = jsonDecode(cachedString) as Map<String, dynamic>;
      final timestamp = cacheData['timestamp'] as int;
      final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      
      return DateTime.now().difference(cacheTime) <= cacheDuration;
    } catch (e) {
      return false;
    }
  }

  Future<void> clearAllCaches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(upcomingKey);
    await prefs.remove(pastKey);
  }

  Future<void> clearCache(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
