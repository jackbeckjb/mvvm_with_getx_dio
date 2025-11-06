import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:structure_mvvm/res/assets/app_assets.dart';

import '../../../res/colors/app_colors.dart';
import '../../../res/fonts/app_fonts.dart';

// exmalpe
//  Get.bottomSheet(
//   ReminderActionBottomSheet(
//     onEditTap: () {
//       Get.off(
//         () => EditReminderScreen(controller: getIt()),
//       );
//     },
//     onDeleteTap: () {
//       Get.close(1);
//       ConfirmAlert.show(
//         icon: AppIcon.deleteIcon,
//         title: "Delete Reminder",
//         message:
//             "Are you sure you want to delete this reminder?",
//         onConfirm: () {
//           Get.close(1);
//         },
//       );
//     },
//   ),
//   isScrollControlled: true,
//   backgroundColor: Colors.transparent,
// );

class ReminderActionBottomSheet extends StatefulWidget {
  final VoidCallback? onEditTap;
  final VoidCallback? onDeleteTap;
  const ReminderActionBottomSheet({
    super.key,
    this.onEditTap,
    this.onDeleteTap,
  });

  @override
  State<ReminderActionBottomSheet> createState() =>
      _ReminderActionBottomSheetState();
}

class _ReminderActionBottomSheetState extends State<ReminderActionBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        gradient: AppColors.bottomSheetBgGradient,

        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.h,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 60.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteExtraFade,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),

            15.verticalSpace,
            GestureDetector(
              onTap: widget.onEditTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppIcon.editSecondIcon, scale: 4.4),
                  10.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Edit Reminder',
                        style: AppFonts.inputTestStyle.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      3.verticalSpace,
                      Text(
                        "You can edit your reminder..!",
                        style: AppFonts.inputLableTestStyle.copyWith(
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            8.verticalSpace,
            Divider(),
            8.verticalSpace,

            GestureDetector(
              onTap: widget.onDeleteTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppIcon.deleteIcon, scale: 10.4),
                  10.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delete Reminder',
                        style: AppFonts.inputTestStyle.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      3.verticalSpace,
                      Text(
                        "You can delete your reminder..!",
                        style: AppFonts.inputLableTestStyle.copyWith(
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
