import 'package:get/get.dart';
import 'package:structure_mvvm/res/routes/routes_name.dart';

class SplashService extends GetxService {
  void initApp() {
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(RoutesName.homeView);
    });
  }
}
