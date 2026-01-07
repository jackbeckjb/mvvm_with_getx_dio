import 'package:flutter/material.dart';

@immutable
class AppGradients extends ThemeExtension<AppGradients> {
  final Gradient bgGradientColor;
  final Gradient bottomSheetBgGradient;

  const AppGradients({
    required this.bgGradientColor,
    required this.bottomSheetBgGradient,
  });

  @override
  AppGradients copyWith({
    Gradient? bgGradientColor,
    Gradient? bottomSheetBgGradient,
  }) {
    return AppGradients(
      bgGradientColor: bgGradientColor ?? this.bgGradientColor,
      bottomSheetBgGradient:
          bottomSheetBgGradient ?? this.bottomSheetBgGradient,
    );
  }

  @override
  AppGradients lerp(ThemeExtension<AppGradients>? other, double t) {
    // this is use full when otherTheme have no extension colors, when this present then use this check point (other == null return this).
    if (other is! AppGradients) return this;

    return AppGradients(
      bgGradientColor: Gradient.lerp(
        bgGradientColor,
        other.bgGradientColor,
        t,
      )!,
      bottomSheetBgGradient: Gradient.lerp(
        bottomSheetBgGradient,
        other.bottomSheetBgGradient,
        t,
      )!,
    );
  }
}
