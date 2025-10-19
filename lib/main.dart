import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_flutter_app/core/network/graphql_client.dart';
import 'package:spacex_flutter_app/data/repositories/graphql_repository_impl.dart';
import 'package:spacex_flutter_app/domain/use_cases/get_launches_use_case.dart';
import 'package:spacex_flutter_app/presentation/providers/launch_provider.dart';
import 'package:spacex_flutter_app/presentation/screens/home_screen.dart';

import 'core/utils/theme.dart';
import 'core/utils/localization/spacex_localization.dart';
import 'presentation/providers/theme_provider.dart';
import 'presentation/providers/language_provider.dart';
import 'presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  await SharedPreferences.getInstance();

  // Wrap the entire app with GraphQLProvider to expose the client
  runApp(
    GraphQLProvider(
      // Use the static client notifier from the service layer
      client: GraphQLService.clientNotifier,
      child: const SpaceXApp(),
    ),
  );
}

class SpaceXApp extends StatefulWidget {
  const SpaceXApp({super.key});

  @override
  State<SpaceXApp> createState() => _SpaceXAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _SpaceXAppState? state = context.findAncestorStateOfType<_SpaceXAppState>();
    state?.setLocale(newLocale);
  }
}

class _SpaceXAppState extends State<SpaceXApp> {
  Locale _locale = const Locale('en', 'US');
  late LanguageProvider _languageProvider;

  @override
  void initState() {
    super.initState();
    _languageProvider = LanguageProvider();
    _initializeLanguage();
  }

  Future<void> _initializeLanguage() async {
    await _languageProvider.initializeLanguage();
    if (mounted) {
      setState(() {
        _locale = _languageProvider.locale;
      });
    }
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // --- UI/Theming/Localization Providers  ---
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => _languageProvider),

        // --- Data Layer: Provide the Repository Implementation ---
        Provider<GraphQLRepositoryImpl>(
          create: (_) => GraphQLRepositoryImpl(),
        ),

        // --- Domain Layer: Provide the Use Case (depends on Repository) ---
        ProxyProvider<GraphQLRepositoryImpl, GetLaunchesUseCase>(
          // The Use Case takes the Repository as an argument
          update: (context, repository, previous) =>
              GetLaunchesUseCase(repository),
        ),

        // --- Presentation Layer: Provide the Notifier (depends on Use Case) ---
        ChangeNotifierProxyProvider<GetLaunchesUseCase, LaunchProvider>(
          // 'create' initializes the notifier by fetching the Use Case from context
          create: (context) => LaunchProvider(
            Provider.of<GetLaunchesUseCase>(context, listen: false),
          ),
          // 'update' ensures the Notifier is reused even if the Use Case changes (it shouldn't here)
          update: (context, useCase, previous) =>
              previous ?? LaunchProvider(useCase),
        ),

        // TODO: Add other notifiers (MissionNotifier, RocketNotifier, etc.)
        // using the same ProxyProvider pattern to inject their respective Use Cases.
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, child) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return GetMaterialApp(
                title: 'SpaceX Flutter App',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeProvider.themeMode,
                locale: _locale,
                localizationsDelegates: const [
                  SpaceXLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', 'US'),
                  Locale('fr', 'FR'),
                ],
                home: const SplashScreen(),
                getPages: [
                  GetPage(name: '/', page: () => const SplashScreen()),
                  GetPage(name: '/home', page: () => const HomeScreen()),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
