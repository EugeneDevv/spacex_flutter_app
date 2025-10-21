import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_flutter_app/core/network/graphql_client.dart';
import 'package:spacex_flutter_app/presentation/spacex_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  await SharedPreferences.getInstance();

  runApp(
    GraphQLProvider(
      // Use the static client notifier from the service layer
      client: GraphQLService.clientNotifier,
      child: const SpaceXApp(),
    ),
  );
}
