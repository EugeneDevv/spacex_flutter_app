import 'package:spacex_flutter_app/data/models/launch_model.dart';
import 'package:spacex_flutter_app/data/queries/launch_queries.dart';
import 'package:spacex_flutter_app/data/repositories/graphql_repository_impl.dart';
import 'package:spacex_flutter_app/domain/entities/launch_entity.dart';
import 'package:spacex_flutter_app/domain/repositories/i_launch_repository.dart';

// This is the concrete implementation of the domain interface.
// It sits in the domain layer as it is the bridge between the domain and data logic.
// In a true implementation, you'd define a LaunchRepositoryImpl in the data layer
// that implements the LaunchRepository interface. For simplicity, we implement
// the logic here and use the generic GraphQLRepositoryImpl for execution.

class GetPastLaunchesUseCase implements ILaunchRepository {
  final GraphQLRepositoryImpl repository;

  GetPastLaunchesUseCase(this.repository);

  @override
  Future<List<LaunchEntity>> getPastLaunches({
    required int limit,
    required int offset,
  }) async {
    final variables = {
      'limit': limit,
      'offset': offset,
    };

    final rawDataList = await repository.executeQuery(
      query: getPastLaunchesQuery,
      queryName: 'launchesPast',
      variables: variables,
    );

    print("Raw Data List: $rawDataList");

    // This is where the mapping happens: from raw API data (Map) to Domain Entity.
    return rawDataList
        .map((rawMap) => LaunchModel.fromJson(rawMap).toEntity())
        .toList();
  }

  // @override
  // Future<LaunchEntity> getLaunchDetails(String id) {
  //   // TODO: implement getLaunchDetails
  //   throw UnimplementedError();
  // }
}
