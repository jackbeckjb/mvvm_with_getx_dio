import 'package:flutter/material.dart';
import 'package:structure_mvvm/res/colors/app_colors.dart';

import '../../res/theme/app_ui_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightBlue,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),

    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
    ),
    cardTheme: CardThemeData(color: AppColors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      titleTextStyle: TextStyle(color: AppColors.black),
      elevation: 0,
    ),
    extensions: [
      AppUiColors(
        primaryColor: AppColors.primaryColor,
        primaryColor50: AppColors.primaryColor50,
        primaryColor80: AppColors.primaryColor80,
        primaryGrayShade: AppColors.primaryGrayShade,
        primaryHomeColor: AppColors.primaryHomeColor,
        primaryShade: AppColors.primaryShade,
        secondaryColor: AppColors.secondaryColor,
        secondaryColorFade: AppColors.secondaryColorFade,
        settingBoxBgColor: AppColors.settingBoxBgColor,
        inputBgColor: AppColors.inputBgColor,
        inputBgColor2: AppColors.inputBgColor2,
        inputSecondaryBgColor: AppColors.inputSecondaryBgColor,
        inputTertiaryBgColor: AppColors.inputTertiaryBgColor,
        lightBlue: AppColors.lightBlue,
        black: AppColors.black,
        blackShadow: AppColors.blackShadow,
        white: AppColors.white,
        whiteFade: AppColors.whiteFade,
        whiteExtraFade: AppColors.whiteExtraFade,
        whiteExtremeFade: AppColors.whiteExtremeFade,
        whiteExtremestFade: AppColors.whiteExtremestFade,
        gray: AppColors.gray,
        litestGray: AppColors.litestGray,
        darkGray: AppColors.darkGray,
        switchDeActiveColor: AppColors.switchDeActiveColor,
        switchActiveColor: AppColors.switchActiveColor,

        red: AppColors.red,
        gradientC1: AppColors.gc1,
        gradientC2: AppColors.gc2,
        gradientC3: AppColors.gc3,

        success: AppColors.success,
        warning: AppColors.warning,
        info: AppColors.info,
      ),
    ],
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightBlue,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.inputBgColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBlue,
    ),
    cardTheme: CardThemeData(color: AppColors.darkGray),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: TextStyle(color: AppColors.white),
    ),
    extensions: [
      //  here we need to reverse the colors for the dark theme according to the design
      AppUiColors(
        primaryColor: AppColors.primaryColor,
        primaryColor50: AppColors.primaryColor50,
        primaryColor80: AppColors.primaryColor80,
        primaryGrayShade: AppColors.primaryGrayShade,
        primaryHomeColor: AppColors.primaryHomeColor,
        primaryShade: AppColors.primaryShade,
        secondaryColor: AppColors.secondaryColor,
        secondaryColorFade: AppColors.secondaryColorFade,
        settingBoxBgColor: AppColors.settingBoxBgColor,
        inputBgColor: AppColors.inputBgColor,
        inputBgColor2: AppColors.inputBgColor2,
        inputSecondaryBgColor: AppColors.inputSecondaryBgColor,
        inputTertiaryBgColor: AppColors.inputTertiaryBgColor,
        lightBlue: AppColors.lightBlue,
        black: AppColors.white, // black to white
        blackShadow: AppColors.whiteFade,
        white: AppColors.black,
        whiteFade: AppColors.whiteFade,
        whiteExtraFade: AppColors.whiteExtraFade,
        whiteExtremeFade: AppColors.whiteExtremeFade,
        whiteExtremestFade: AppColors.whiteExtremestFade,
        gray: AppColors.gray,
        litestGray: AppColors.litestGray,
        darkGray: AppColors.darkGray,
        switchDeActiveColor: AppColors.switchDeActiveColor,
        switchActiveColor: AppColors.switchActiveColor,

        red: AppColors.red,
        gradientC1: AppColors.gc1,
        gradientC2: AppColors.gc2,
        gradientC3: AppColors.gc3,

        success: AppColors.success,
        warning: AppColors.warning,
        info: AppColors.info,
      ),
    ],
  );
}
