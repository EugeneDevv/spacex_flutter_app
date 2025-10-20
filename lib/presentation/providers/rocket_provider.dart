import 'package:flutter/foundation.dart';
import 'package:spacex_flutter_app/data/models/rocket_model.dart';
import 'package:spacex_flutter_app/domain/use_cases/get_rockets_use_case.dart';

class RocketProvider extends ChangeNotifier {
  // Dependencies: Use Cases are injected via the constructor
  final GetRocketsUseCase getRocketsUseCase;

  RocketProvider(this.getRocketsUseCase);

  // --- Common Pagination State ---
  static const int _pageSize = 20;

  // --- CAPSULES STATE ---
  List<RocketModel> _rockets = [];
  bool _isLoadingInitial = false;
  bool _isFetchingMore = false;
  bool _hasMoreData = true;
  String? _errorMessage;
  int _offset = 0;

  List<RocketModel> get rockets => _rockets;
  bool get isLoadingInitial => _isLoadingInitial;
  bool get isFetchingMore => _isFetchingMore;
  bool get hasMoreData => _hasMoreData;
  String? get errorMessage => _errorMessage;

  // --- METHODS ---

  Future<void> fetchRockets({bool isInitial = false}) async {
    if (!isInitial && (_isFetchingMore || !_hasMoreData)) return;

    if (isInitial) {
      _isLoadingInitial = true;
      _offset = 0;
      _rockets = [];
      _hasMoreData = true;
      _errorMessage = null;
    } else {
      _isFetchingMore = true;
    }
    notifyListeners();

    try {
      final newRockets = await getRocketsUseCase.getRockets(
        limit: _pageSize,
        offset: _offset,
      );

      if (newRockets.isEmpty) {
        _hasMoreData = false;
      } else {
        _rockets.addAll(newRockets);
        _offset += _pageSize;
        _hasMoreData = newRockets.length == _pageSize;
      }
    } catch (e) {
      if (kDebugMode) print('Rockets Notifier Error: $e');
      _errorMessage =
          'Failed to load rockets: Check network connection.';
      _hasMoreData = false;
    } finally {
      _isLoadingInitial = false;
      _isFetchingMore = false;
      notifyListeners();
    }
  }


  void clearRockets() {
    _rockets = [];
    _offset = 0;
    _hasMoreData = true;
    _errorMessage = null;
    notifyListeners();
  }
}
