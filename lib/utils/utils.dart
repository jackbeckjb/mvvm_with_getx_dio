import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../res/colors/app_colors.dart';

class Utils {
  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static errorMessage(String message, {String title = "On Snap!"}) {
    CherryToast(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      action: Text(message),
      animationType: AnimationType.fromLeft,
      toastPosition: Position.bottom,
      height: 70,
      inheritThemeColors: false,
      iconWidget: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.info,
        ),
        child: Icon(Icons.error_outline, color: AppColors.white),
      ),
      displayIcon: true,
      actionHandler: () {},
      onToastClosed: () {},
      autoDismiss: true,
      toastDuration: Duration(seconds: 5),
      borderRadius: 10.r,
      horizontalAlignment: CrossAxisAlignment.start,
      themeColor: AppColors.info,
      backgroundColor: AppColors.info,
    ).show(Get.context!);
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message);
  }
}

// --- ENUM FOR SNACKBAR TYPES ---
enum AwesomeSnackbarType { success, error, warning, info }

// --- HELPER FUNCTION TO GET ICON AND COLOR BASED ON TYPE ---
class AwesomeSnackbarData {
  final IconData icon; // Main icon within the snackbar
  final Color color;
  final IconData patternIcon; // The icon to use for the background pattern
  final IconData floatingIcon; // The large, floating icon on the left

  AwesomeSnackbarData({
    required this.icon,
    required this.color,
    required this.patternIcon,
    required this.floatingIcon, // New property
  });

  static AwesomeSnackbarData getByType(AwesomeSnackbarType type) {
    switch (type) {
      case AwesomeSnackbarType.success:
        return AwesomeSnackbarData(
          icon: Icons.check_circle_outline,
          color: const Color(0xFF28a745), // A nice green
          patternIcon: Icons.check_circle_outline,
          floatingIcon: Icons.check_circle, // Solid check for floating icon
        );
      case AwesomeSnackbarType.error:
        return AwesomeSnackbarData(
          icon: Icons.highlight_off,
          color: const Color(0xFFdc3545), // A nice red
          patternIcon: Icons.highlight_off,
          floatingIcon: Icons.close_rounded, // Solid X for floating icon
        );
      case AwesomeSnackbarType.warning:
        return AwesomeSnackbarData(
          icon: Icons.warning_amber_rounded,
          color: const Color(0xFFffc107), // A nice orange
          patternIcon: Icons.warning_amber_rounded,
          floatingIcon:
              Icons.warning_rounded, // Solid warning for floating icon
        );
      case AwesomeSnackbarType.info:
        return AwesomeSnackbarData(
          icon: Icons.help_outline,
          color: const Color(0xFF007bff), // A nice blue
          patternIcon: Icons.help_outline,
          floatingIcon: Icons.help_rounded, // Solid question for floating icon
        );
    }
  }
}

// --- THE CUSTOM SNACKBAR WIDGET ---
class CustomAwesomeSnackbar extends StatelessWidget {
  final String title;
  final String message;
  final AwesomeSnackbarType type;
  final VoidCallback? onClose; // Optional callback for the close button

  const CustomAwesomeSnackbar({
    super.key,
    required this.title,
    required this.message,
    this.type = AwesomeSnackbarType.info, // Default to info
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final snackbarData = AwesomeSnackbarData.getByType(type);

    return Stack(
      // <--- NEW OUTER STACK
      clipBehavior: Clip.none, // <--- IMPORTANT: Allows children to overflow
      children: [
        // --- MAIN SNACKBAR CONTAINER (EXISTING CODE) ---
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: snackbarData.color,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: snackbarData.color.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          clipBehavior: Clip.none,
          child: Stack(
            // Inner stack for background patterns and content
            children: [
              // --- BACKGROUND PATTERN ICONS ---
              Positioned(
                top: -15,
                left: -15,
                child: Icon(
                  snackbarData.patternIcon,
                  color: Colors.white.withOpacity(0.1),
                  size: 80,
                ),
              ),
              Positioned(
                bottom: -15,
                right: -15,
                child: Icon(
                  snackbarData.patternIcon,
                  color: Colors.white.withOpacity(0.1),
                  size: 80,
                ),
              ),

              // --- MAIN SNACKBAR CONTENT ---
              Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ).copyWith(left: 60.0), // <--- ADJUSTED LEFT PADDING
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Removed the inline leading icon here
                    // It will now be the floating icon outside the container
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (onClose != null)
                      GestureDetector(
                        onTap: onClose,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // --- FLOATING ERROR ICON (NEW) ---
        Positioned(
          left: 20, // Align with the left edge of the SnackBar's content
          top:
              0, // Adjust this to move it up or down relative to the top of the snackbar
          child: Container(
            padding: const EdgeInsets.all(5), // Padding inside the circle
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: snackbarData.color, // Background of the floating icon
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              snackbarData.floatingIcon,
              color: AppColors.white, // Icon color matches snackbar color
              size: 35, // Adjust size as needed
            ),
          ),
        ),
      ],
    );
  }
}

// --- HOW TO SHOW THE SNACKBAR (EXAMPLE) ---
// (Remains the same as before)
void showAwesomeSnackbar(
  BuildContext context,
  String title,
  String message,
  AwesomeSnackbarType type,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomAwesomeSnackbar(
        title: title,
        message: message,
        type: type,
        onClose: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      duration: const Duration(seconds: 4),
    ),
  );
}
