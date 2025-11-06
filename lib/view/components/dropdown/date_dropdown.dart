import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/colors/app_colors.dart';
import '../../../res/fonts/app_fonts.dart';

class DateDropdownPicker extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime? value)? onDateChanged;
  final Color? backgroundColor;
  final Color? borderColor;

  const DateDropdownPicker({
    super.key,
    this.initialDate,
    this.onDateChanged,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  State<DateDropdownPicker> createState() => _DateDropdownPickerState();
}

class _DateDropdownPickerState extends State<DateDropdownPicker> {
  int? selectedYear;
  int? selectedMonth;
  int? selectedDay;

  @override
  void initState() {
    DateTime initialDate = DateTime.now();
    selectedYear = initialDate.year;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    selectedYear = null;
    selectedMonth = null;
    selectedDay = null;
  }

  List<int> get years {
    final currentYear = DateTime.now().year;
    return List.generate(20, (i) => currentYear - 10 + i);
  }

  List<int> get months => List.generate(12, (i) => i + 1);

  List<int> get days {
    if (selectedYear == null || selectedMonth == null) return [];
    final daysInMonth = DateTime(selectedYear!, selectedMonth! + 1, 0).day;
    return List.generate(daysInMonth, (i) => i + 1);
  }

  DateTime? get selectedDate {
    if (selectedYear != null && selectedMonth != null && selectedDay != null) {
      return DateTime(selectedYear!, selectedMonth!, selectedDay!);
    }
    return null;
  }

  void _notifyDateChange() {
    widget.onDateChanged?.call(selectedDate);
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  Widget _buildDropdown({
    required String hint,
    required dynamic value,
    required List<dynamic> items,
    required void Function(dynamic)? onChanged,
    bool isMonth = false,
    double? width,
  }) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColors.whiteExtremestFade,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: widget.borderColor ?? Colors.transparent,
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: value,
          hint: Text(hint, style: AppFonts.inputLableTestStyle),
          dropdownColor: widget.backgroundColor ?? AppColors.whiteExtremestFade,
          iconEnabledColor: AppColors.lightBlue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, size: 20.sp),
          iconSize: 20.w,
          isExpanded: true,
          items: items
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    isMonth
                        ? _getMonthName(item)
                        : item.toString().padLeft(2, '0'),
                    style: AppFonts.inputTestStyle.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildDropdown(
          hint: 'MM',
          value: selectedMonth,
          items: months,
          isMonth: true,
          width: 130.w,
          onChanged: (val) {
            setState(() {
              selectedMonth = val;

              if (selectedDay != null) {
                final maxDays = DateTime(
                  selectedYear ?? DateTime.now().year,
                  selectedMonth! + 1,
                  0,
                ).day;
                if (selectedDay! > maxDays) {
                  selectedDay = maxDays;
                }
              }
            });
            _notifyDateChange();
          },
        ),
        _buildDropdown(
          hint: 'DD',
          value: selectedDay,
          items: days,
          width: 80.w,
          onChanged: (val) {
            setState(() => selectedDay = val);
            _notifyDateChange();
          },
        ),
        Expanded(
          child: _buildDropdown(
            hint: 'YY',
            value: selectedYear,
            items: years,
            onChanged: (val) {
              setState(() {
                selectedYear = val;
                // Adjust day if it's invalid for the new year (leap year consideration)
                if (selectedDay != null && selectedMonth != null) {
                  final maxDays = DateTime(
                    selectedYear!,
                    selectedMonth! + 1,
                    0,
                  ).day;
                  if (selectedDay! > maxDays) {
                    selectedDay = maxDays;
                  }
                }
              });
              _notifyDateChange();
            },
          ),
        ),
      ],
    );
  }
}
