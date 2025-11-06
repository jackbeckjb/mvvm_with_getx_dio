import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:structure_mvvm/res/fonts/app_fonts.dart';

import '../../../res/colors/app_colors.dart';

enum TextFieldType { normal, password, email, phone, search }

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextFieldType type;
  final bool isEnabled;
  final bool isRequired;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? labelText;
  final String? helperText;
  final Color? backgroundColor;
  final Color? textColor;
  final bool boxShadow;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool showBorder;
  final Color? borderColor;
  final double? borderWidth;
  final bool isReadOnly;
  final bool autofocus;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.type = TextFieldType.normal,
    this.isEnabled = true,
    this.isRequired = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.labelText,
    this.helperText,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.contentPadding,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth,
    this.isReadOnly = false,
    this.autofocus = false,
    this.focusNode,
    this.boxShadow = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = true;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: widget.boxShadow
            ? [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.1),
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
              ]
            : null,
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        enabled: widget.isEnabled,
        readOnly: widget.isReadOnly,
        autofocus: widget.autofocus,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        keyboardType: _getKeyboardType(),
        textInputAction: widget.textInputAction ?? _getTextInputAction(),
        obscureText: _getObscureText(),
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        cursorColor: AppColors.white,

        onTap: widget.onTap,
        style: AppFonts.inputTestStyle,

        decoration: InputDecoration(
          filled: true,

          fillColor: widget.backgroundColor ?? AppColors.intputBgColor,
          hintText: widget.hintText,
          hintStyle: AppFonts.inputLableTestStyle,

          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.intputBgColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          contentPadding:
              widget.contentPadding ??
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          prefixIcon: widget.prefixIcon,
          prefixIconConstraints: BoxConstraints(
            maxWidth: 40.w,
            minWidth: 30.w,
            maxHeight: 40.h,
            minHeight: 30.h,
          ),
          suffixIcon: _buildSuffixIcon(),
          counterText: '',
          helperText: widget.helperText,
          helperStyle: GoogleFonts.lato(
            color: AppColors.whiteExtremeFade,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }

    switch (widget.type) {
      case TextFieldType.password:
        return IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: AppColors.gray,
            size: 20.sp,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        );
      case TextFieldType.search:
        return Icon(Icons.search, color: AppColors.gray, size: 20.sp);
      default:
        return null;
    }
  }

  bool _getObscureText() {
    if (widget.type == TextFieldType.password) {
      return _isPasswordVisible;
    }
    return widget.obscureText;
  }

  TextInputType _getKeyboardType() {
    if (widget.keyboardType != null) {
      return widget.keyboardType!;
    }

    switch (widget.type) {
      case TextFieldType.email:
        return TextInputType.emailAddress;
      case TextFieldType.phone:
        return TextInputType.phone;
      case TextFieldType.password:
        return TextInputType.visiblePassword;
      default:
        return TextInputType.text;
    }
  }

  TextInputAction _getTextInputAction() {
    switch (widget.type) {
      case TextFieldType.password:
        return TextInputAction.done;
      case TextFieldType.email:
        return TextInputAction.next;
      case TextFieldType.phone:
        return TextInputAction.done;
      default:
        return TextInputAction.next;
    }
  }
}
