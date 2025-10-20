import 'package:spacex_flutter_app/data/models/rocket_model.dart';

abstract class IRocketRepository {
    Future<List<RocketModel>> getRockets({
    required int limit,
    required int offset,
  });
}
