import 'package:flutter/foundation.dart';
import 'package:spacex_flutter_app/domain/entities/launch_entity.dart';
import 'package:spacex_flutter_app/domain/use_cases/get_past_launches_use_case.dart';

// TODO: Implement LaunchProvider
// This is a placeholder for the launch state management
// You need to implement:
// 1. Launch data models
// 2. GraphQL queries for launches
// 3. Repository pattern for data fetching
// 4. State management for launches list, loading, error states

class LaunchProvider extends ChangeNotifier {
  // Dependency: The Use Case is injected via the constructor
  final GetPastLaunchesUseCase _getPastLaunchesUseCase;

  LaunchProvider(this._getPastLaunchesUseCase) {
    // Automatically start loading data when the Notifier is created
    fetchPastLaunches(isInitial: true);
  }

  // --- State Variables ---
  List<LaunchEntity> _launches = [];
  bool _isLoadingInitial = false;
  bool _isFetchingMore = false;
  bool _hasMoreData = true;
  String? _errorMessage;

  // --- Getters for UI access ---
  List<LaunchEntity> get launches => _launches;
  bool get isLoadingInitial => _isLoadingInitial;
  bool get isFetchingMore => _isFetchingMore;
  bool get hasMoreData => _hasMoreData;
  String? get errorMessage => _errorMessage;

  // --- Pagination State ---
  static const int _pageSize = 20;
  int _offset = 0;

  /// Resets state and calls the Use Case to fetch data, managing pagination.
  Future<void> fetchPastLaunches({bool isInitial = false}) async {
    if (!isInitial && (_isFetchingMore || !_hasMoreData)) return;

    if (isInitial) {
      _isLoadingInitial = true;
      _offset = 0;
      _launches = [];
      _hasMoreData = true;
      _errorMessage = null;
    } else {
      _isFetchingMore = true;
    }
    notifyListeners();

    try {
      // 2. USE CASE EXECUTION: The notifier calls the Use Case.
      // The Use Case handles the repository call and Model-to-Entity mapping.
      final newLaunches = await _getPastLaunchesUseCase.getPastLaunches(
        limit: _pageSize,
        offset: _offset,
      );

      if (newLaunches.isEmpty) {
        _hasMoreData = false;
      } else {
        _launches.addAll(newLaunches);
        _offset += _pageSize;
        _hasMoreData = newLaunches.length == _pageSize;
      }
    } catch (e) {
      if (kDebugMode) print('Notifier Error: $e');
      _errorMessage = 'Failed to load launches: Check network connection.';
      _hasMoreData = false;
    } finally {
      _isLoadingInitial = false;
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  void clearLaunches() {
    _launches = [];
    _offset = 0;
    _hasMoreData = true;
    _errorMessage = null;
    notifyListeners();
  }
}
