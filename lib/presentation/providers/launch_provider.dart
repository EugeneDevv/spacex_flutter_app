import 'package:flutter/foundation.dart';
import 'package:spacex_flutter_app/domain/entities/launch_entity.dart';
import 'package:spacex_flutter_app/domain/use_cases/get_launches_use_case.dart';

enum LaunchType { past, upcoming }

class LaunchProvider extends ChangeNotifier {
  // Dependencies: Use Cases are injected via the constructor
  final GetLaunchesUseCase getLaunchesUseCase;

  LaunchProvider(this.getLaunchesUseCase) {
    // Automatically start loading both lists when the Notifier is created
    fetchPastLaunches(isInitial: true);
    fetchUpcomingLaunches(isInitial: true);
  }

  // --- Common Pagination State ---
  static const int _pageSize = 20;

  // --- PAST LAUNCH STATE ---
  List<LaunchEntity> _pastLaunches = [];
  bool _isPastLoadingInitial = false;
  bool _isPastFetchingMore = false;
  bool _pastHasMoreData = true;
  String? _pastErrorMessage;
  int _pastOffset = 0;

  List<LaunchEntity> get pastLaunches => _pastLaunches;
  bool get isPastLoadingInitial => _isPastLoadingInitial;
  bool get isPastFetchingMore => _isPastFetchingMore;
  bool get pastHasMoreData => _pastHasMoreData;
  String? get pastErrorMessage => _pastErrorMessage;

  // --- UPCOMING LAUNCH STATE ---
  List<LaunchEntity> _upcomingLaunches = [];
  bool _isUpcomingLoadingInitial = false;
  bool _isUpcomingFetchingMore = false;
  bool _upcomingHasMoreData = true;
  String? _upcomingErrorMessage;
  int _upcomingOffset = 0;

  List<LaunchEntity> get upcomingLaunches => _upcomingLaunches;
  bool get isUpcomingLoadingInitial => _isUpcomingLoadingInitial;
  bool get isUpcomingFetchingMore => _isUpcomingFetchingMore;
  bool get upcomingHasMoreData => _upcomingHasMoreData;
  String? get upcomingErrorMessage => _upcomingErrorMessage;

  // --- PAST LAUNCH METHODS ---

  Future<void> fetchPastLaunches({bool isInitial = false}) async {
    if (!isInitial && (_isPastFetchingMore || !_pastHasMoreData)) return;

    if (isInitial) {
      _isPastLoadingInitial = true;
      _pastOffset = 0;
      _pastLaunches = [];
      _pastHasMoreData = true;
      _pastErrorMessage = null;
    } else {
      _isPastFetchingMore = true;
    }
    notifyListeners();

    try {
      final newLaunches = await getLaunchesUseCase.getPastLaunches(
        limit: _pageSize,
        offset: _pastOffset,
      );

      if (newLaunches.isEmpty) {
        _pastHasMoreData = false;
      } else {
        _pastLaunches.addAll(newLaunches);
        _pastOffset += _pageSize;
        _pastHasMoreData = newLaunches.length == _pageSize;
      }
    } catch (e) {
      if (kDebugMode) print('Past Launches Notifier Error: $e');
      _pastErrorMessage =
          'Failed to load past launches: Check network connection.';
      _pastHasMoreData = false;
    } finally {
      _isPastLoadingInitial = false;
      _isPastFetchingMore = false;
      notifyListeners();
    }
  }

  // --- UPCOMING LAUNCH METHODS ---

  Future<void> fetchUpcomingLaunches({bool isInitial = false}) async {
    if (!isInitial && (_isUpcomingFetchingMore || !_upcomingHasMoreData))
      return;

    if (isInitial) {
      _isUpcomingLoadingInitial = true;
      _upcomingOffset = 0;
      _upcomingLaunches = [];
      _upcomingHasMoreData = true;
      _upcomingErrorMessage = null;
    } else {
      _isUpcomingFetchingMore = true;
    }
    notifyListeners();

    try {
      final newLaunches = await getLaunchesUseCase.getUpComingLaunches(
        limit: _pageSize,
        offset: _upcomingOffset,
      );

      if (newLaunches.isEmpty) {
        _upcomingHasMoreData = false;
      } else {
        _upcomingLaunches.addAll(newLaunches);
        _upcomingOffset += _pageSize;
        _upcomingHasMoreData = newLaunches.length == _pageSize;
      }
    } catch (e) {
      if (kDebugMode) print('Upcoming Launches Notifier Error: $e');
      _upcomingErrorMessage =
          'Failed to load upcoming launches: Check network connection.';
      _upcomingHasMoreData = false;
    } finally {
      _isUpcomingLoadingInitial = false;
      _isUpcomingFetchingMore = false;
      notifyListeners();
    }
  }

  void clearLaunches() {
    _pastLaunches = [];
    _upcomingLaunches = [];
    _pastOffset = 0;
    _upcomingOffset = 0;
    _pastHasMoreData = true;
    _upcomingHasMoreData = true;
    _pastErrorMessage = null;
    _upcomingErrorMessage = null;
    notifyListeners();
  }
}
