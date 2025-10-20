import 'package:flutter/foundation.dart';
import 'package:spacex_flutter_app/data/models/capsule_model.dart';
import 'package:spacex_flutter_app/domain/use_cases/get_capsules_use_case.dart';

class CapsuleProvider extends ChangeNotifier {
  // Dependencies: Use Cases are injected via the constructor
  final GetCapsulesUseCase getCapsulesUseCase;

  CapsuleProvider(this.getCapsulesUseCase);

  // --- Common Pagination State ---
  static const int _pageSize = 20;

  // --- CAPSULES STATE ---
  List<CapsuleModel> _capsules = [];
  bool _isLoadingInitial = false;
  bool _isFetchingMore = false;
  bool _hasMoreData = true;
  String? _errorMessage;
  int _offset = 0;

  List<CapsuleModel> get capsules => _capsules;
  bool get isLoadingInitial => _isLoadingInitial;
  bool get isFetchingMore => _isFetchingMore;
  bool get hasMoreData => _hasMoreData;
  String? get errorMessage => _errorMessage;

  // --- METHODS ---

  Future<void> fetchCapsules({bool isInitial = false}) async {
    if (!isInitial && (_isFetchingMore || !_hasMoreData)) return;

    if (isInitial) {
      _isLoadingInitial = true;
      _offset = 0;
      _capsules = [];
      _hasMoreData = true;
      _errorMessage = null;
    } else {
      _isFetchingMore = true;
    }
    notifyListeners();

    try {
      final newCapsules = await getCapsulesUseCase.getCapsules(
        limit: _pageSize,
        offset: _offset,
      );

      if (newCapsules.isEmpty) {
        _hasMoreData = false;
      } else {
        _capsules.addAll(newCapsules);
        _offset += _pageSize;
        _hasMoreData = newCapsules.length == _pageSize;
      }
    } catch (e) {
      if (kDebugMode) print('Past Capsules Notifier Error: $e');
      _errorMessage =
          'Failed to load past launches: Check network connection.';
      _hasMoreData = false;
    } finally {
      _isLoadingInitial = false;
      _isFetchingMore = false;
      notifyListeners();
    }
  }


  void clearCapsules() {
    _capsules = [];
    _offset = 0;
    _hasMoreData = true;
    _errorMessage = null;
    notifyListeners();
  }
}
