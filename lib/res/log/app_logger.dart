import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

/// A colorful logger for Flutter apps with full-line coloring.
///
/// Example:
/// ```dart
/// AppLogger.info("Controller created", tag: "ReminderDetailsController");
/// AppLogger.error("API failed", tag: "LoginController");
/// AppLogger.success("User logged in", tag: "Auth");
/// ```
class AppLogger {
  // ANSI color codes
  static const String reset =
      '\x1B[0m'; // Stop applying color or style — go back to normal text.
  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String magenta = '\x1B[35m';
  static const String gray = '\x1B[90m';

  /// Whether logging is enabled (disabled automatically in release mode)
  static bool isEnabled = kDebugMode;

  static void _log(String message, String label, String color, {String? tag}) {
    if (!isEnabled) return;

    final now = DateTime.now().toIso8601String();
    final tagText = tag != null ? " [$tag]" : "";
    final logText = "[$label]$tagText [$now] → $message";

    // Apply color to the whole line
    final coloredLog = "$color$logText$reset";

    developer.log(coloredLog, name: "AppLogger");
  }

  /// Info-level log (blue)
  static void info(String message, {String? tag}) =>
      _log(message, "INFO", magenta, tag: tag);

  /// Success-level log (green)
  static void success(String message, {String? tag}) =>
      _log(message, "SUCCESS", green, tag: tag);

  /// Warning-level log (yellow)
  static void warning(String message, {String? tag}) =>
      _log(message, "WARNING", yellow, tag: tag);

  /// Error-level log (red)
  static void error(String message, {String? tag}) =>
      _log(message, "ERROR", red, tag: tag);

  /// Verbose / gray log
  static void verbose(String message, {String? tag}) =>
      _log(message, "VERBOSE", gray, tag: tag);
}
