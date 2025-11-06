import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/res/assets/app_assets.dart';
import '../../../res/colors/app_colors.dart';
import '../../../res/fonts/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? backIconColor;
  final double? elevation;
  final bool centerTitle;
  final bool isDrawer;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.actions,
    this.showBackButton = true,
    this.backgroundColor,
    this.titleColor,
    this.backIconColor,
    this.elevation,
    this.centerTitle = true,
    this.isDrawer = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: elevation ?? 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? IconButton(
              icon: isDrawer
                  ? Image.asset(AppIcon.drawerIcon, scale: 4.4)
                  : Icon(
                      Icons.arrow_back_ios,
                      color: backIconColor ?? AppColors.lightBlue,
                      size: 20.sp,
                    ),
              onPressed: onBackPressed ?? () => Get.back(),
            )
          : null,
      title: Text(
        title,
        style: AppFonts.screenTitleTextStyle.copyWith(
          color: titleColor ?? AppColors.white,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
