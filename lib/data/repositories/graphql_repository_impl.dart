import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_flutter_app/core/network/graphql_client.dart';

// This is the concrete implementation that directly handles network calls
// using the static GraphQLService.

class GraphQLRepositoryImpl {
  // Access the client via the static getter, no need for injection here
  GraphQLClient get _client => GraphQLService.client;

  GraphQLRepositoryImpl();

  /// Handles error checking for any GraphQL QueryResult.
  void _checkForErrors(QueryResult result) {
    if (result.hasException) {
      if (kDebugMode) {
        print('GraphQL Error: ${result.exception.toString()}');
        if (result.exception?.linkException != null) {
          print(
              'Link Exception: ${result.exception!.linkException.toString()}');
        }
      }
      throw Exception(
          'Failed to load data: Check network or API configuration. ${result.exception.toString()}');
    }
  }

  /// Executes a GraphQL Query that is expected to return a single Map (object).
  Future<Map<String, dynamic>> executeSingleQuery({
    required String query,
    required String queryName, // e.g., "launch"
    Map<String, dynamic>? variables,
  }) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables ?? const {},
      fetchPolicy: FetchPolicy.networkOnly,
    );

    final QueryResult result = await _client.query(options);

    _checkForErrors(result);

    // Safely extract the data map based on the query name
    final data = result.data?[queryName] as Map<String, dynamic>?;

    if (data == null) {
      // If the data is null, the object was not found.
      throw Exception('Object not found for query: $queryName');
    }

    return data;
  }

  /// Executes a GraphQL Query that is expected to return a List of Maps.
  Future<List<Map<String, dynamic>>> executeListQuery({
    required String query,
    required String queryName, // e.g., "launchesPast"
    Map<String, dynamic>? variables,
  }) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables ?? const {},
      fetchPolicy: FetchPolicy.networkOnly,
    );

    final QueryResult result = await _client.query(options);

    _checkForErrors(result);

    // Safely extract the data list based on the query name
    final data = result.data?[queryName] as List<dynamic>?;

    if (data == null) {
      return [];
    }

    // Cast the list of dynamic maps to the expected type
    return data.cast<Map<String, dynamic>>();
  }
}
