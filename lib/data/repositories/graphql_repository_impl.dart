import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_flutter_app/core/network/graphql_client.dart';

// This is the concrete implementation that directly handles network calls
// using the static GraphQLService.

class GraphQLRepositoryImpl {
  // Access the client via the static getter, no need for injection here
  GraphQLClient get _client => GraphQLService.client;

  // Constructor is clean as client is accessed statically
  GraphQLRepositoryImpl();

  /// Executes a generic GraphQL Query.
  /// Returns a list of raw maps.
  Future<List<Map<String, dynamic>>> executeQuery({
    required String query,
    required String queryName, // e.g., 'launchesPast', 'rockets', etc.
    Map<String, dynamic>? variables,
  }) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables ?? const {},
      fetchPolicy: FetchPolicy.networkOnly,
    );

    // Use the client getter
    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      if (kDebugMode) {
        print('GraphQL Error: ${result.exception.toString()}');
      }
      // Throw the exception to be caught by the notifier/provider
      throw Exception('Failed to load data: ${result.exception.toString()}');
    }

    // Safely extract the data list based on the query name
    final data = result.data?[queryName] as List<dynamic>?;

    if (data == null) {
      return [];
    }

    // Cast the list of dynamic maps to the expected type
    return data.cast<Map<String, dynamic>>();
  }
}
