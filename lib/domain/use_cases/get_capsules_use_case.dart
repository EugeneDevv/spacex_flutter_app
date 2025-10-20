import 'package:spacex_flutter_app/data/models/capsule_model.dart';
import 'package:spacex_flutter_app/data/queries/capsule_queries.dart';
import 'package:spacex_flutter_app/data/repositories/graphql_repository_impl.dart';
import 'package:spacex_flutter_app/domain/repositories/i_capsule_repository.dart';

// This is the concrete implementation of the domain interface.
// It sits in the domain layer as it is the bridge between the domain and data logic.
// In a true implementation, you'd define a CapsuleRepositoryImpl in the data layer
// that implements the CapsuleRepository interface. For simplicity, we implement
// the logic here and use the generic GraphQLRepositoryImpl for execution.

class GetCapsulesUseCase implements ICapsuleRepository {
  final GraphQLRepositoryImpl repository;

  GetCapsulesUseCase(this.repository);

  @override
  Future<List<CapsuleModel>> getCapsules({
    required int limit,
    required int offset,
  }) async {
    final variables = {
      'limit': limit,
      'offset': offset,
    };

    final rawDataList = await repository.executeListQuery(
      query: getAllCapsulesQuery,
      queryName: 'capsules',
      variables: variables,
    );

    // This is where the mapping happens: from raw API data (Map) to Domain Entity.
    return rawDataList.map((rawMap) => CapsuleModel.fromJson(rawMap)).toList();
  }

  @override
  Future<CapsuleModel> geCapsuleDetails(String id) async {
    final variables = {
      'capsuleId': id,
    };

    final rawData = await repository.executeSingleQuery(
      query: getCapsuleDetailsQuery,
      queryName: 'capsule',
      variables: variables,
    );

    // This is where the mapping happens: from raw API data (Map) to Domain Entity.
    return CapsuleModel.fromJson(rawData);
  }
}
