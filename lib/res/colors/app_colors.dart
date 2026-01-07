import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF1D4287);
  static const Color primaryColor50 = Color.fromARGB(127, 29, 66, 135);
  static const Color primaryColor80 = Color.fromARGB(139, 29, 66, 135);
  static const Color primaryGrayShade = Color.fromARGB(242, 56, 83, 133);
  static const Color primaryHomeColor = Color(0xFF0B224E);
  static const Color primaryShade = Color(0xFF09265E);
  static const Color settingBoxBgColor = Color(0xFF102C60);
  static const Color inputBgColor = Color(0x95001844);
  static const Color inputBgColor2 = Color.fromARGB(97, 0, 24, 68);
  static const Color inputSecondaryBgColor = Color(0xFF001844);
  static const Color inputTertiaryBgColor = Color(0xFF16336D);
  static const Color secondaryColor = Color(0xFF4786CD);
  static const Color secondaryColorFade = Color(0xFF254C96);
  static const Color lightBlue = Color(0xFF66B0FC);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color blackShadow = Color.fromARGB(200, 0, 0, 0);

  static const Color whiteFade = Color(0xC7FFFFFF);
  static const Color whiteExtraFade = Color(0x95FFFFFF);
  static const Color whiteExtremeFade = Color(0x31FFFFFF);
  static const Color whiteExtremestFade = Color.fromARGB(26, 255, 255, 255);
  static const Color gray = Color(0xFF9CA3AF);
  static const Color litestGray = Color.fromARGB(115, 38, 38, 38);

  static const Color darkGray = Color(0xFF6B7280);
  static const Color switchActiveColor = Color(0xFF7AE12B);
  static const Color switchDeActiveColor = Color(0xFF6B8DAF);
  static const Color red = Color(0xFFEF4444);

  static const Color error = Color(0xFFEF5350); // Red - Error
  static const Color warning = Color(0xFFFFA726); // Orange - Warning
  static const Color success = Color(0xFF66BB6A); // Green - Success
  static const Color info = Color(0xFF42A5F5); // Blue - Info

  // bottom sheet Bg gradient platter
  static const Color gc1 = Color(0xFF596688);
  static const Color gc2 = Color(0xFF3E4550);
  static const Color gc3 = Color(0xFF3D444E);

  static const Gradient bgGradientColor = LinearGradient(
    begin: AlignmentGeometry.topCenter,
    end: AlignmentGeometry.bottomCenter,
    colors: [primaryColor, primaryColor, secondaryColor],
  );

  static const Gradient bottomSheetBgGradient = LinearGradient(
    begin: AlignmentGeometry.topCenter,
    end: AlignmentGeometry.bottomCenter,
    colors: [gc1, gc2, gc3],
  );
}
