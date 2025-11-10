import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF1D4287);
  static const Color primaryColor50 = Color.fromARGB(127, 29, 66, 135);
  static const Color primaryColor80 = Color.fromARGB(139, 29, 66, 135);
  static const Color primaryGrayShade = Color.fromARGB(242, 56, 83, 133);
  static const Color primaryHomeColor = Color(0xFF0B224E);
  static const Color primaryShade = Color(0xFF09265E);
  static const Color settingBoxBgColor = Color(0xFF102C60);
  static const Color intputBgColor = Color(0x95001844);
  static const Color intputBgColor2 = Color.fromARGB(97, 0, 24, 68);
  static const Color intputSecondaryBgColor = Color(0xFF001844);
  static const Color intputTertiarySecondaryBgColor = Color(0xFF16336D);
  static const Color secondaryColor = Color(0xFF4786CD);
  static const Color secondaryColorFade = Color(0xFF254C96);
  static const Color lightBlue = Color(0xFF66B0FC);

  static const Color slidingDotBlue = Color(0xFF66B0FC);
  static const Color slidingDotBlueOp50 = Color(0xFF3CB0FC);
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
  static const Color green = Color(0xFF00FF22);
  static const Color switchActiveColor = Color(0xFF7AE12B);
  static const Color switchDeActiveColor = Color(0xFF6B8DAF);
  static const Color red = Color(0xFFEF4444);
  static const Color orange = Color(0xFFFFB444);

  // Colors platter for modal bottom sheet
  static const Color color1 = Color(0xFFFFB444);
  static const Color color2 = Color(0xFF0B224E);
  static const Color color3 = Color(0xFF56AFFF);
  static const Color color4 = Color(0xFFFB7B89);
  static const Color color5 = Color(0xFF569EE5);
  static const Color color6 = Color(0xFF8491B4);
  static const Color color7 = Color(0xFF417AE5);
  static const Color color8 = Color(0xFF262626);
  static const Color color9 = Color(0xFF242424);
  static const Color color10 = Color(0xFFEACEB9);
  static const Color color11 = Color(0xFFE79888);
  static const Color color12 = Color(0xFFABB7E4);
  static const Color color13 = Color(0xFFCDDEBF);
  static const Color color14 = Color(0xFFF1C7C3);
  static const Color color15 = Color(0xFF8CB8CC);
  static const Color color16 = Color(0xFFDFC5E3);
  static const Color color17 = Color(0xFFC8D6D9);
  static const Color color18 = Color(0xFFEEAEC8);

  static const Color error = Color(0xFFEF5350); // Red - Error
  static const Color warning = Color(0xFFFFA726); // Orange - Warning
  static const Color success = Color(0xFF66BB6A); // Green - Success
  static const Color info = Color(0xFF42A5F5); // Blue - Info

  //List Of Tag Colors
  static List<Color> tags = [tagColor1, tagColor2, tagColor3];
  static const tagColor1 = Color(0xFFEC7377);
  static const tagColor2 = Color(0xFF56AFFF);
  static const tagColor3 = Color(0xFF916C07);
  // End Tag Colors

  // location manager card color platter
  static const Color lightPink = Color(0xFFFB7B89);
  static const Color purple = Color(0xFFAE75E2);
  static const Color limegreen = Color(0xFFDAF552);
  static const Color skyBlue = Color(0xFF61EFEE);

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
  static Gradient reminderOccurrenceGradient = LinearGradient(
    begin: AlignmentGeometry.topCenter,
    end: AlignmentGeometry.bottomCenter,
    colors: [lightBlue, primaryHomeColor.withValues(alpha: 0.7)],
  );

  static Gradient randomGrident(List<Color> colors) {
    return LinearGradient(
      begin: AlignmentGeometry.topCenter,
      end: AlignmentGeometry.bottomCenter,
      colors: colors,
    );
  }

  static List<List<Color>> randomCardColors = [
    [Color(0xFF0483A6), Color(0xFF027BB5), Color(0xFF0270B7)],
    [Color(0xFF2A59B9), Color(0xFF2152B5), Color(0xFF1B4AAA)],
    [Color(0xFF585EB9), Color(0xFF4D5B9E), Color(0xFF3A5177)],
  ];
}
