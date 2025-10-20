import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:spacex_flutter_app/presentation/router/routes.dart';
import 'package:spacex_flutter_app/presentation/screens/home_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/launch_details_screen.dart';
import 'package:spacex_flutter_app/presentation/screens/splash_screen.dart';

// class LaunchDetailBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<LaunchDetailController>(() => LaunchDetailController());
//   }
// }

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
      // binding:
      //     LaunchDetailBinding(), // Binds the controller for the detail screen
      // transition: Transition.cupertino,
    ),
  ];
}
