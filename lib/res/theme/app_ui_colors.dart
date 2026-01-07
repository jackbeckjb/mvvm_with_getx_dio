import 'package:flutter/material.dart';

@immutable
class AppUiColors extends ThemeExtension<AppUiColors> {
  final Color primaryColor;
  final Color primaryColor50;
  final Color primaryColor80;
  final Color primaryGrayShade;
  final Color primaryHomeColor;
  final Color primaryShade;
  final Color settingBoxBgColor;
  final Color inputBgColor;
  final Color inputBgColor2;
  final Color inputSecondaryBgColor;
  final Color inputTertiaryBgColor;
  final Color secondaryColor;
  final Color secondaryColorFade;
  final Color lightBlue;

  final Color white;
  final Color black;
  final Color blackShadow;
  final Color whiteFade;
  final Color whiteExtraFade;
  final Color whiteExtremeFade;
  final Color whiteExtremestFade;
  final Color gray;
  final Color litestGray;
  final Color darkGray;

  final Color switchActiveColor;
  final Color switchDeActiveColor;
  final Color red;

  final Color gradientC1;
  final Color gradientC2;
  final Color gradientC3;

  final Color success;
  final Color warning;
  final Color info;

  const AppUiColors({
    required this.gradientC1,
    required this.gradientC2,
    required this.gradientC3,
    required this.primaryColor,
    required this.primaryColor50,
    required this.primaryColor80,
    required this.primaryGrayShade,
    required this.primaryHomeColor,
    required this.primaryShade,
    required this.settingBoxBgColor,
    required this.inputBgColor,
    required this.inputBgColor2,
    required this.inputSecondaryBgColor,
    required this.inputTertiaryBgColor,
    required this.secondaryColor,
    required this.secondaryColorFade,
    required this.lightBlue,

    required this.white,
    required this.black,
    required this.blackShadow,
    required this.whiteFade,
    required this.whiteExtraFade,
    required this.whiteExtremeFade,
    required this.whiteExtremestFade,
    required this.gray,
    required this.litestGray,
    required this.darkGray,

    required this.switchActiveColor,
    required this.switchDeActiveColor,
    required this.red,

    required this.success,
    required this.warning,
    required this.info,
  });

  @override
  AppUiColors copyWith({
    Color? gradientC1,
    Color? gradientC2,
    Color? gradientC3,
    Color? primaryColor,
    Color? primaryColor50,
    Color? primaryColor80,
    Color? primaryGrayShade,
    Color? primaryHomeColor,
    Color? primaryShade,
    Color? settingBoxBgColor,
    Color? inputBgColor,
    Color? inputBgColor2,
    Color? inputSecondaryBgColor,
    Color? inputTertiaryBgColor,
    Color? secondaryColor,
    Color? secondaryColorFade,
    Color? lightBlue,
    Color? slidingDotBlue,
    Color? slidingDotBlueOp50,
    Color? white,
    Color? black,
    Color? blackShadow,
    Color? whiteFade,
    Color? whiteExtraFade,
    Color? whiteExtremeFade,
    Color? whiteExtremestFade,
    Color? gray,
    Color? litestGray,
    Color? darkGray,

    Color? switchActiveColor,
    Color? switchDeActiveColor,
    Color? red,

    Color? success,
    Color? warning,
    Color? info,
  }) {
    return AppUiColors(
      gradientC1: gradientC1 ?? this.gradientC1,
      gradientC2: gradientC2 ?? this.gradientC2,
      gradientC3: gradientC3 ?? this.gradientC3,
      primaryColor: primaryColor ?? this.primaryColor,
      black: black ?? this.black,
      blackShadow: blackShadow ?? this.blackShadow,
      darkGray: darkGray ?? this.darkGray,
      gray: gray ?? this.gray,

      inputBgColor: inputBgColor ?? this.inputBgColor,
      inputBgColor2: inputBgColor2 ?? this.inputBgColor2,
      inputSecondaryBgColor:
          inputSecondaryBgColor ?? this.inputSecondaryBgColor,
      inputTertiaryBgColor: inputTertiaryBgColor ?? this.inputTertiaryBgColor,
      lightBlue: lightBlue ?? this.lightBlue,
      litestGray: litestGray ?? this.litestGray,

      primaryColor50: primaryColor50 ?? this.primaryColor50,
      primaryColor80: primaryColor80 ?? this.primaryColor80,
      primaryGrayShade: primaryGrayShade ?? this.primaryGrayShade,
      primaryHomeColor: primaryHomeColor ?? this.primaryHomeColor,
      primaryShade: primaryShade ?? this.primaryShade,
      red: red ?? this.red,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      secondaryColorFade: secondaryColorFade ?? this.secondaryColorFade,
      settingBoxBgColor: settingBoxBgColor ?? this.settingBoxBgColor,

      switchActiveColor: switchActiveColor ?? this.switchActiveColor,
      switchDeActiveColor: switchDeActiveColor ?? this.switchDeActiveColor,
      white: white ?? this.white,
      whiteExtraFade: whiteExtraFade ?? this.whiteExtraFade,
      whiteExtremeFade: whiteExtremeFade ?? this.whiteExtremeFade,
      whiteExtremestFade: whiteExtremestFade ?? this.whiteExtremestFade,
      whiteFade: whiteFade ?? this.whiteFade,

      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }

  @override
  AppUiColors lerp(ThemeExtension<AppUiColors>? other, double t) {
    if (other is! AppUiColors) return this;
    return AppUiColors(
      gradientC1: Color.lerp(gradientC1, other.gradientC1, t)!,
      gradientC2: Color.lerp(gradientC2, other.gradientC2, t)!,
      gradientC3: Color.lerp(gradientC3, other.gradientC3, t)!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      primaryColor50: Color.lerp(primaryColor50, other.primaryColor50, t)!,
      primaryColor80: Color.lerp(primaryColor80, other.primaryColor80, t)!,
      primaryGrayShade: Color.lerp(
        primaryGrayShade,
        other.primaryGrayShade,
        t,
      )!,
      primaryHomeColor: Color.lerp(
        primaryHomeColor,
        other.primaryHomeColor,
        t,
      )!,
      primaryShade: Color.lerp(primaryShade, other.primaryShade, t)!,
      settingBoxBgColor: Color.lerp(
        settingBoxBgColor,
        other.settingBoxBgColor,
        t,
      )!,
      inputBgColor: Color.lerp(inputBgColor, other.inputBgColor, t)!,
      inputBgColor2: Color.lerp(inputBgColor2, other.inputBgColor2, t)!,
      inputSecondaryBgColor: Color.lerp(
        inputSecondaryBgColor,
        other.inputSecondaryBgColor,
        t,
      )!,
      inputTertiaryBgColor: Color.lerp(
        inputTertiaryBgColor,
        other.inputTertiaryBgColor,
        t,
      )!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      secondaryColorFade: Color.lerp(
        secondaryColorFade,
        other.secondaryColorFade,
        t,
      )!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,

      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      blackShadow: Color.lerp(blackShadow, other.blackShadow, t)!,
      whiteFade: Color.lerp(whiteFade, other.whiteFade, t)!,
      whiteExtraFade: Color.lerp(whiteExtraFade, other.whiteExtraFade, t)!,
      whiteExtremeFade: Color.lerp(
        whiteExtremeFade,
        other.whiteExtremeFade,
        t,
      )!,
      whiteExtremestFade: Color.lerp(
        whiteExtremestFade,
        other.whiteExtremestFade,
        t,
      )!,
      gray: Color.lerp(gray, other.gray, t)!,
      litestGray: Color.lerp(litestGray, other.litestGray, t)!,
      darkGray: Color.lerp(darkGray, other.darkGray, t)!,

      switchActiveColor: Color.lerp(
        switchActiveColor,
        other.switchActiveColor,
        t,
      )!,
      switchDeActiveColor: Color.lerp(
        switchDeActiveColor,
        other.switchDeActiveColor,
        t,
      )!,
      red: Color.lerp(red, other.red, t)!,

      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }
}
