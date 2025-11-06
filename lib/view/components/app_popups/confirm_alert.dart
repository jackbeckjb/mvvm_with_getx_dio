import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../res/colors/app_colors.dart';
import '../../../res/fonts/app_fonts.dart';
import '../buttons/primary_button.dart';
import '../buttons/secondary_button.dart';

class ConfirmAlert {
  static void show({
    required String title,
    required String message,
    String confirmText = "Yes, I want",
    String cancelText = "No, I Don't",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String? icon,
    bool barrierDismissible = true,
  }) {
    Get.dialog(
      _ConfirmAlertDialog(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        icon: icon,
      ),
      barrierDismissible: barrierDismissible,
    );
  }
}

class _ConfirmAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String? icon;

  const _ConfirmAlertDialog({
    required this.title,
    required this.message,
    required this.confirmText,
    required this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.lightBlue, AppColors.secondaryColor],
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -5,
              right: -5,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(Icons.close, color: AppColors.white),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                10.verticalSpace,
                if (icon != null) ...[
                  Image.asset(icon!, scale: 4.4),
                  SizedBox.shrink(),
                ],
                10.verticalSpace,
                Text(
                  title,
                  style: AppFonts.buttonTextStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                10.verticalSpace,
                Text(
                  message,
                  style: AppFonts.buttonTextStyle.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                15.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        text: cancelText,
                        onPressed: () {
                          Get.back();
                          onCancel?.call();
                        },
                        borderColor: AppColors.white,
                        textColor: AppColors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: PrimaryButton(
                        text: confirmText,
                        fontSize: 14.sp,
                        onPressed: () {
                          Get.back();
                          onConfirm?.call();
                        },
                        backgroundColor: AppColors.primaryShade,
                        textColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
