import 'package:spacex_flutter_app/data/models/rocket_model.dart';
import 'package:spacex_flutter_app/data/queries/rocket_queries.dart';
import 'package:spacex_flutter_app/data/repositories/graphql_repository_impl.dart';
import 'package:spacex_flutter_app/domain/repositories/i_rocket_repository.dart';

// This is the concrete implementation of the domain interface.
// It sits in the domain layer as it is the bridge between the domain and data logic.
// In a true implementation, you'd define a RocketRepositoryImpl in the data layer
// that implements the RocketRepository interface. For simplicity, we implement
// the logic here and use the generic GraphQLRepositoryImpl for execution.

class GetRocketsUseCase implements IRocketRepository {
  final GraphQLRepositoryImpl repository;

  GetRocketsUseCase(this.repository);

  @override
  Future<List<RocketModel>> getRockets({
    required int limit,
    required int offset,
  }) async {
    final variables = {
      'limit': limit,
      'offset': offset,
    };

    final rawDataList = await repository.executeListQuery(
      query: getAllRocketsQuery,
      queryName: 'rockets',
      variables: variables,
    );

    // This is where the mapping happens: from raw API data (Map) to Domain Entity.
    return rawDataList.map((rawMap) => RocketModel.fromJson(rawMap)).toList();
  }
}
