import 'package:flutter/material.dart';
import 'package:structure_mvvm/res/theme/app_gradient.dart';

import '../theme/app_ui_colors.dart';

extension ThemeX on BuildContext {
  AppUiColors get adaptiveColor => Theme.of(this).extension<AppUiColors>()!;
  AppGradients get adaptiveGradient =>
      Theme.of(this).extension<AppGradients>()!;
}
