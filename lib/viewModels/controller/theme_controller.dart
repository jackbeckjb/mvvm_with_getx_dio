import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isLightMode = true.obs;
  void toggleTheme() {
    isLightMode.value = isLightMode.value ? false : true;
    Get.changeThemeMode(isLightMode.value ? ThemeMode.light : ThemeMode.dark);
  }
}
