import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:spacex_flutter_app/presentation/router/routes.dart';
import 'package:spacex_flutter_app/presentation/screens/home_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/launch_details_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/rocket_details_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.launchDetails,
      page: () => const LaunchDetailsScreen(),
    ),
    GetPage(
      name: Routes.rocketDetails,
      page: () => const RocketDetailsScreen(),
    ),
  ];
}
