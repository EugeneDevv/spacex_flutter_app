import 'package:spacex_flutter_app/domain/entities/launch_entity.dart';

abstract class ILaunchRepository {
    Future<List<LaunchEntity>> getPastLaunches({
    required int limit,
    required int offset,
  });

    Future<List<LaunchEntity>> getUpComingLaunches({
    required int limit,
    required int offset,
  });
  
  Future<LaunchEntity> getLaunchDetails(String id);
}
