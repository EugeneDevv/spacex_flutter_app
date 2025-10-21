// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:spacex_flutter_app/core/cache/capsule_cache_manager.dart';
import 'package:spacex_flutter_app/core/cache/rocket_cache_manager.dart';
import 'package:spacex_flutter_app/core/utils/localization/spacex_localization.dart';
import 'package:spacex_flutter_app/core/utils/theme.dart';
import 'package:spacex_flutter_app/core/cache/launch_cache_manager.dart';
import 'package:spacex_flutter_app/core/network/connectivity_manager.dart';
import 'package:spacex_flutter_app/data/repositories/graphql_repository_impl.dart';
import 'package:spacex_flutter_app/domain/use_cases/get_capsules_use_case.dart';
import 'package:spacex_flutter_app/domain/use_cases/get_launches_use_case.dart';
import 'package:spacex_flutter_app/domain/use_cases/get_rockets_use_case.dart';
import 'package:spacex_flutter_app/presentation/providers/capsule_provider.dart';
import 'package:spacex_flutter_app/presentation/providers/language_provider.dart';
import 'package:spacex_flutter_app/presentation/providers/launch_provider.dart';
import 'package:spacex_flutter_app/presentation/providers/rocket_provider.dart';
import 'package:spacex_flutter_app/presentation/providers/theme_provider.dart';
import 'package:spacex_flutter_app/presentation/router/app_pages.dart';
import 'package:spacex_flutter_app/presentation/router/routes.dart';

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

  // Global instances of core services/dependencies
  late GraphQLRepositoryImpl _repository;
  late LaunchCacheManager _launchCacheManager;
  late CapsuleCacheManager _capsuleCacheManager;
  late RocketCacheManager _rocketCacheManager;
  late ConnectivityManager _connectivityManager;

  @override
  void initState() {
    super.initState();
    _languageProvider = LanguageProvider();
    _initializeLanguage();

    // Initialize the singleton-like instances here
    _repository = GraphQLRepositoryImpl();
    _launchCacheManager = LaunchCacheManager();
    _capsuleCacheManager = CapsuleCacheManager();
    _rocketCacheManager = RocketCacheManager();
    _connectivityManager = ConnectivityManager();
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
        // UI/Theming/Localization Providers
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => _languageProvider),

        // Core Services / Data Layer: Provide Singleton Instances
        Provider<GraphQLRepositoryImpl>.value(value: _repository),
        Provider<LaunchCacheManager>.value(value: _launchCacheManager),
        Provider<CapsuleCacheManager>.value(value: _capsuleCacheManager),
        Provider<RocketCacheManager>.value(value: _rocketCacheManager),
        Provider<ConnectivityManager>.value(value: _connectivityManager),

        // Domain Layer: GetLaunchesUseCase (needs 3 dependencies)
        ProxyProvider3<GraphQLRepositoryImpl, LaunchCacheManager,
            ConnectivityManager, GetLaunchesUseCase>(
          update: (context, repository, launchCacheManager, connectivityManager,
                  previous) =>
              GetLaunchesUseCase(
                  repository, launchCacheManager, connectivityManager),
        ),

        // Domain Layer: GetCapsulesUseCase (needs 3 dependencies)
        ProxyProvider3<GraphQLRepositoryImpl, CapsuleCacheManager,
            ConnectivityManager, GetCapsulesUseCase>(
          update: (context, repository, capsuleCacheManager,
                  connectivityManager, previous) =>
              GetCapsulesUseCase(
                  repository, capsuleCacheManager, connectivityManager),
        ),

        // Domain Layer: GetRocketsUseCase (needs 3 dependencies) - FIXED
        ProxyProvider3<GraphQLRepositoryImpl, RocketCacheManager,
            ConnectivityManager, GetRocketsUseCase>(
          update: (context, repository, rocketCacheManager, connectivityManager,
                  previous) =>
              GetRocketsUseCase(
                  repository, rocketCacheManager, connectivityManager),
        ),

        // Presentation Layer: LaunchProvider (depends on Use Case)
        ChangeNotifierProxyProvider<GetLaunchesUseCase, LaunchProvider>(
          create: (context) => LaunchProvider(
            Provider.of<GetLaunchesUseCase>(context, listen: false),
          ),
          update: (context, useCase, previous) =>
              previous ?? LaunchProvider(useCase),
        ),

        // Presentation Layer: CapsuleProvider (depends on Use Case)
        ChangeNotifierProxyProvider<GetCapsulesUseCase, CapsuleProvider>(
          create: (context) => CapsuleProvider(
            Provider.of<GetCapsulesUseCase>(context, listen: false),
          ),
          update: (context, useCase, previous) =>
              previous ?? CapsuleProvider(useCase),
        ),

        // Presentation Layer: RocketProvider (depends on Use Case)
        ChangeNotifierProxyProvider<GetRocketsUseCase, RocketProvider>(
          create: (context) => RocketProvider(
            Provider.of<GetRocketsUseCase>(context, listen: false),
          ),
          update: (context, useCase, previous) =>
              previous ?? RocketProvider(useCase),
        ),
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
                initialRoute: Routes.splash,
                getPages: AppPages.pages,
              );
            },
          );
        },
      ),
    );
  }
}
