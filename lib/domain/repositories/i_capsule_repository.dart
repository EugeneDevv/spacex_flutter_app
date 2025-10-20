import 'package:spacex_flutter_app/data/models/capsule_model.dart';

abstract class ICapsuleRepository {
    Future<List<CapsuleModel>> getCapsules({
    required int limit,
    required int offset,
  });
  
  Future<CapsuleModel> geCapsuleDetails(String id);
}
