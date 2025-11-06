import 'package:intl/intl.dart';

class DateUtilsHelper {
  /// 🗓 Human-readable date (e.g. Today, Tomorrow, Monday, Oct 27, Oct 27, 2025)
  static String humanReadableDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final input = DateTime(date.year, date.month, date.day);
    final difference = input.difference(today).inDays;

    if (difference == 0) return 'Today';
    if (difference == 1) return 'Tomorrow';
    if (difference == -1) return 'Yesterday';
    if (difference.abs() < 7 && input.isAfter(today)) {
      return DateFormat('EEEE').format(date); // e.g. Monday
    }
    if (date.year == now.year) {
      return DateFormat('MMM d').format(date); // e.g. Oct 27
    }
    return DateFormat('MMM d, yyyy').format(date); // e.g. Oct 27, 2025
  }

  /// 📅 Full date like: Monday, October 27, 2025
  static String fullDate(DateTime date) =>
      DateFormat('EEEE, MMMM d, yyyy').format(date);

  /// 🕒 12-hour time format: 05:30 PM
  static String time12Hour(DateTime date) => DateFormat('hh:mm a').format(date);

  /// ⏰ 24-hour time format: 17:30
  static String time24Hour(DateTime date) => DateFormat('HH:mm').format(date);

  /// 📆 Combined human-readable datetime (e.g. Today at 05:30 PM)
  static String humanReadableDateTime(DateTime date) {
    final datePart = humanReadableDate(date);
    final timePart = DateFormat('hh:mm a').format(date);
    return '$datePart at $timePart';
  }

  /// 🔁 Relative format (e.g. "3 days ago", "in 2 days")
  static String relativeDate(DateTime date) {
    final now = DateTime.now();
    final diff = date.difference(now).inDays;

    if (diff == 0) return 'Today';
    if (diff == 1) return 'Tomorrow';
    if (diff == -1) return 'Yesterday';
    if (diff > 1) return 'In $diff days';
    return '${diff.abs()} days ago';
  }

  // 🧮 Standard and common date formats

  /// 27-10-2025
  static String formatDDMMYYYY(DateTime date) =>
      DateFormat('dd-MM-yyyy').format(date);

  /// 27/10/2025
  static String formatDDMMYYYYSlash(DateTime date) =>
      DateFormat('dd/MM/yyyy').format(date);

  /// 2025-10-27
  static String formatYYYYMMDD(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

  /// 27 Oct 2025
  static String formatDDMonYYYY(DateTime date) =>
      DateFormat('dd MMM yyyy').format(date);

  /// 27 October 2025
  static String formatDDMonthYYYY(DateTime date) =>
      DateFormat('dd MMMM yyyy').format(date);

  /// Monday, 27 Oct 2025
  static String formatDayDDMonYYYY(DateTime date) =>
      DateFormat('EEEE, dd MMM yyyy').format(date);

  /// 27-10-25 (short year)
  static String formatShortYear(DateTime date) =>
      DateFormat('dd-MM-yy').format(date);

  /// 27 Oct, 05:30 PM
  static String formatDateAndTime(DateTime date) =>
      DateFormat('dd MMM, hh:mm a').format(date);

  /// Get month name only (e.g. October)
  static String monthName(DateTime date) => DateFormat('MMMM').format(date);

  /// Get short day name (e.g. Mon, Tue, Wed)
  static String shortDayName(DateTime date) => DateFormat('E').format(date);
}
