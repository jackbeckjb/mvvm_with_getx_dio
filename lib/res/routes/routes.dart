import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:structure_mvvm/core/service_locator.dart';
import 'package:structure_mvvm/res/routes/routes_name.dart';
import 'package:structure_mvvm/view/screens/home_screen.dart';
import 'package:structure_mvvm/view/screens/splash.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(service: getIt()),

      transition: Transition.fade,
      transitionDuration: const Duration(microseconds: 250),
    ),
    GetPage(
      name: RoutesName.homeView,
      page: () => HomeScreen(controller: getIt(), themeController: getIt()),
      transition: Transition.fade,
      transitionDuration: const Duration(microseconds: 250),
    ),
  ];
}
