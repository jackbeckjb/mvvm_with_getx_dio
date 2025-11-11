import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// --- ENUM FOR SNACKBAR TYPES ---
enum AwesomeSnackbarType { success, error, warning, info }

// --- HELPER FUNCTION TO GET ICON AND COLOR BASED ON TYPE ---
class AwesomeSnackbarData {
  final IconData icon; // Main icon within the snackbar
  final Color color; // Main snackbar body color
  final Color color2; // Floating icon background color
  final IconData patternIcon; // The icon to use for the background pattern
  final IconData floatingIcon; // The large, floating icon on the left

  AwesomeSnackbarData({
    required this.icon,
    required this.color,
    required this.color2,
    required this.patternIcon,
    required this.floatingIcon,
  });

  static AwesomeSnackbarData getByType(AwesomeSnackbarType type) {
    switch (type) {
      case AwesomeSnackbarType.success:
        return AwesomeSnackbarData(
          icon: Icons.check_circle_outline,
          color: const Color(0xFF38B058), // Green Body
          color2: const Color(0xFF2E8A48), // Darker Green Floating Circle
          patternIcon: Icons.check_circle_outline,
          floatingIcon: Icons.check, // Simple checkmark icon
        );
      case AwesomeSnackbarType.error:
        return AwesomeSnackbarData(
          icon: Icons.highlight_off,
          color: const Color(0xFFE44E57), // Red Body
          color2: const Color(0xFFC73D45), // Darker Red Floating Circle
          patternIcon: Icons.highlight_off,
          floatingIcon: Icons.close_rounded, // Close icon
        );
      case AwesomeSnackbarType.warning:
        return AwesomeSnackbarData(
          icon: Icons.warning_amber_rounded,
          color: const Color(0xFFF79632), // Orange Body
          color2: const Color(0xFFD8781B), // Darker Orange Floating Circle
          patternIcon: Icons.warning_amber_rounded,
          floatingIcon: Icons.warning_rounded, // Warning icon
        );
      case AwesomeSnackbarType.info:
        return AwesomeSnackbarData(
          icon: Icons.help_outline,
          color: const Color(0xFF339AF0), // Blue Body
          color2: const Color(0xFF257BC5), // Darker Blue Floating Circle
          patternIcon: Icons.help_outline,
          floatingIcon: Icons.question_mark_rounded, // Question mark icon
        );
    }
  }
}

// --- THE CUSTOM SNACKBAR WIDGET ---
class CustomAwesomeSnackbar extends StatelessWidget {
  final String title;
  final String message;
  final AwesomeSnackbarType type;
  final VoidCallback? onClose;

  const CustomAwesomeSnackbar({
    super.key,
    required this.title,
    required this.message,
    this.type = AwesomeSnackbarType.info,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final snackbarData = AwesomeSnackbarData.getByType(type);

    return Stack(
      // Outer Stack allows the icon to float outside the main content's bounds
      clipBehavior: Clip.none,
      children: [
        // --- MAIN SNACKBAR CONTAINER ---
        Container(
          decoration: BoxDecoration(
            color: snackbarData.color,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: snackbarData.color.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          // *** FIX: Use Clip.antiAlias to cut the content at the rounded corners ***
          clipBehavior: Clip.antiAlias,
          child: Stack(
            // Inner stack for background patterns and content
            children: [
              // --- BACKGROUND PATTERN ICONS (unchanged) ---
              Positioned(
                top: -15,
                left: -15,
                child: Icon(
                  snackbarData.patternIcon,
                  color: snackbarData.color2,
                  size: 80,
                ),
              ),
              Positioned(
                bottom: -15,
                right: -15,
                child: Icon(
                  snackbarData.patternIcon,
                  color: snackbarData.color2,
                  size: 80,
                ),
              ),

              // --- MAIN SNACKBAR CONTENT ---
              Padding(
                // Use a larger left padding to make room for the floating icon
                padding: const EdgeInsets.all(16.0).copyWith(left: 60.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
        // --- FLOATING ICON (UNCHANGED POSITIONING) ---
        Positioned(
          left: 10.w, // Adjusted left position slightly
          top: -15.h, // Adjusted top position slightly to make it look 'cut'
          child: Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  snackbarData.color2, // Darker color for the circle background
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              snackbarData.floatingIcon,
              color:
                  Colors.white, // Assuming AppColors.white means Colors.white
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}

// The function that opens the snackbar.
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
      dismissDirection: DismissDirection.startToEnd,

      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(20.r),
      duration: const Duration(seconds: 4),
    ),
  );
}
