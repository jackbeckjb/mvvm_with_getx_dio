import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:structure_mvvm/res/fonts/app_fonts.dart';

import '../../../res/colors/app_colors.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hintText;
  final T? value;
  final List<T> items;
  final Function(T?) onChanged;
  final String Function(T) itemBuilder;
  final bool isEnabled;
  final bool isRequired;
  final String? labelText;
  final String? errorText;
  final Color? menuBackgroundColor;
  final Color? fillColor;
  final Color? textColor;
  final Color? hintColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool showBorder;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool boxShadow;
  final bool isLoading;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.itemBuilder,
    this.isLoading = false,
    this.isEnabled = true,
    this.boxShadow = true,
    this.fillColor,
    this.isRequired = false,
    this.labelText,
    this.errorText,
    this.menuBackgroundColor,
    this.textColor,
    this.hintColor,
    this.borderRadius,
    this.contentPadding,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadow
            ? [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.1),
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
              ]
            : null,
      ),
      child: DropdownButtonFormField<T>(
        initialValue: value,
        onChanged: isEnabled ? onChanged : null,
        style: AppFonts.inputTestStyle.copyWith(overflow: TextOverflow.clip),
        hint: Text(hintText, style: AppFonts.inputLableTestStyle),
        isExpanded: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? AppColors.intputBgColor,

          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          contentPadding:
              contentPadding ??
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          prefixIcon: prefixIcon,
          // suffixIconConstraints: BoxConstraints(maxWidth: 90.w, minWidth: 60.w),
          suffixIcon: suffixIcon == null
              ? isLoading
                    ? SizedBox(
                        width: 8.r,
                        height: 8.r,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.lightBlue,
                      )
              : null,
        ),
        dropdownColor: menuBackgroundColor ?? AppColors.primaryColor,
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,

            child: Text(
              itemBuilder(item),
              // maxLines: 1,
              style: GoogleFonts.manrope(
                color: AppColors.white,
                fontSize: 14.sp,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      ),
    );
  }
}
