import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

/// FlutterColorLogger: Colorful console logging extension for Flutter/Dart.
///
/// This extension adds convenient getters to print colored text and boxed logs
/// directly from strings. It supports:
/// - Standard and bright ANSI colors
/// - Colored boxed logs with "═" lines
/// - Multi-line text
/// - Enabling/disabling ANSI color codes
/// - Enabling/disabling all logging globally
///
/// Example usage:
/// ```dart
/// // Enable/disable all logging
/// FlutterColorLogger.enableLogging = true;
/// // Enable/disable ANSI colors
/// FlutterColorLogger.enableAnsi = true;
///
/// "This is an info message".logInfo;
/// "Success! Task completed".logSuccess;
/// "Warning: Check input values".logWarning;
/// "Error occurred!".logError;
/// "Debug message here".logDebug;
/// ```
extension FlutterColorLogger on String {
  /// Enable or disable ANSI color codes globally.
  ///
  /// Set to `false` to print logs without any color.
  static bool enableAnsi = true;

  /// Enable or disable all logging globally.
  ///
  /// Set to `false` to completely suppress all logs.
  static bool enableLogging = true;

  /// Wraps the text with ANSI color codes if enabled.
  String _wrap(String text, String code) =>
      enableAnsi ? '\x1B[${code}m$text\x1B[0m' : text;

  // ----------------- ANSI Color Codes -----------------
  /// ANSI code for _red color.
  static const _red = '31';

  /// ANSI code for _green color.
  static const _green = '32';

  /// ANSI code for _yellow color.
  static const _yellow = '33';

  /// ANSI code for blue color.
  static const _blue = '34';

  /// ANSI code for purple color.
  static const _purple = '35';

  /// ANSI code for cyan color.
  static const _cyan = '36';

  /// ANSI code for white color.
  static const _white = '37';

  /// ANSI code for bright red color.
  static const _brightRed = '91';

  /// ANSI code for bright green color.
  static const _brightGreen = '92';

  /// ANSI code for bright yellow color.
  static const _brightYellow = '93';

  /// ANSI code for bright blue color.
  static const _brightBlue = '94';

  /// ANSI code for bright purple color.
  static const _brightPurple = '95';

  /// ANSI code for bright cyan color.
  static const _brightCyan = '96';

  // ----------------- Simple colored logs -----------------
  /// Prints the string in red color.
  void get logRed =>
      enableLogging && kDebugMode ? _printColored(_wrap(this, _red)) : null;

  /// Prints the string in _green color.
  void get logGreen =>
      enableLogging && kDebugMode ? _printColored(_wrap(this, _green)) : null;

  /// Prints the string in _yellow color.
  void get logYellow =>
      enableLogging && kDebugMode ? _printColored(_wrap(this, _yellow)) : null;

  /// Prints the string in blue color.
  void get logBlue =>
      enableLogging && kDebugMode ? _printColored(_wrap(this, _blue)) : null;

  /// Prints the string in purple color.
  void get logPurple =>
      enableLogging && kDebugMode ? _printColored(_wrap(this, _purple)) : null;

  /// Prints the string in cyan color.
  void get logCyan =>
      enableLogging && kDebugMode ? _printColored(_wrap(this, _cyan)) : null;

  /// Prints the string in white color.
  void get logWhite =>
      enableLogging && kDebugMode ? _printColored(_wrap(this, _white)) : null;

  /// Prints the string in bright red color.
  void get logBrightRed => enableLogging && kDebugMode
      ? _printColored(_wrap(this, _brightRed))
      : null;

  /// Prints the string in bright _green color.
  void get logBrightGreen => enableLogging && kDebugMode
      ? _printColored(_wrap(this, _brightGreen))
      : null;

  /// Prints the string in bright yellow color.
  void get logBrightYellow => enableLogging && kDebugMode
      ? _printColored(_wrap(this, _brightYellow))
      : null;

  /// Prints the string in bright blue color.
  void get logBrightBlue => enableLogging && kDebugMode
      ? _printColored(_wrap(this, _brightBlue))
      : null;

  /// Prints the string in bright purple color.
  void get logBrightPurple => enableLogging && kDebugMode
      ? _printColored(_wrap(this, _brightPurple))
      : null;

  /// Prints the string in bright cyan color.
  void get logBrightCyan => enableLogging && kDebugMode
      ? _printColored(_wrap(this, _brightCyan))
      : null;
// ----------------- Boxed / Fancy logs -----------------
  /// Prints the string inside a boxed log with a specific color and optional name/level.
  ///
  /// Example usage:
  /// `dart
  /// "Operation succeeded".logSuccess; // default name and level
  /// "Critical error".logError; // uses default level, but color red
  /// `
// ----------------- Boxed / Fancy Log Getters -----------------
  /// Prints the string inside a green boxed log labeled "Success".
  ///
  /// Example:
  /// `dart
  /// "Task completed successfully".logSuccess;
  /// `
  void get logSuccess => enableLogging && kDebugMode
      ? _logBox(color: _brightGreen, name: 'Success', level: 800)
      : null;

  /// Prints the string inside a red boxed log labeled "Error".
  ///
  /// Example:
  /// `dart
  /// "Failed to load data".logError;
  /// `
  void get logError => enableLogging && kDebugMode
      ? _logBox(color: _brightRed, name: 'Error', level: 1000)
      : null;

  /// Prints the string inside a yellow boxed log labeled "Warning".
  ///
  /// Example:
  /// `dart
  /// "Input value might be incorrect".logWarning;
  /// `
  void get logWarning => enableLogging && kDebugMode
      ? _logBox(color: _brightYellow, name: 'Warning', level: 900)
      : null;

  /// Prints the string inside a blue boxed log labeled "Info".
  ///
  /// Example:
  /// `dart
  /// "Fetching user details".logInfo;
  /// `
  void get logInfo => enableLogging && kDebugMode
      ? _logBox(color: _brightBlue, name: 'Info', level: 800)
      : null;

  /// Prints the string inside a purple boxed log labeled "Debug".
  ///
  /// Example:
  /// `dart
  /// "Variable x = 42".logDebug;
  /// `
  void get logDebug => enableLogging && kDebugMode
      ? _logBox(color: _brightPurple, name: 'Debug', level: 700)
      : null;

  /// Prints the string inside a cyan boxed log labeled "Cyan".
  ///
  /// Example:
  /// `dart
  /// "Custom cyan message".logCyanBox;
  /// `
  void get logCyanBox => enableLogging && kDebugMode
      ? _logBox(color: _brightCyan, name: 'Cyan', level: 800)
      : null;

  /// Internal method for printing a colored string to the console in debug mode.
  ///
  /// This method respects `kDebugMode` and ensures logs only appear during development.
  void _printColored(String code) {
    if (kDebugMode) {
      print(code);
    }
  }

  /// Internal method for printing boxed/fancy logs.
  ///
  /// [color] ANSI color code for the text and box.
  /// [padding] Spaces around the text inside the box (default 4).
  void _logBox({
    String color = _brightGreen,
    int padding = 4,
    String name = 'FlutterColorLogger',
    int level = 800,
    DateTime? time,
  }) {
    if (!enableLogging || !kDebugMode) return;

    final lines = split('\n').map((l) => l.trimRight()).toList();
    if (lines.isEmpty) return;

    final maxLength =
        lines.map((l) => l.length).reduce((a, b) => a > b ? a : b);
    final totalLength = maxLength + padding * 2;
    final border = '═' * totalLength;

    if (kDebugMode) print(_wrap(border, color));
    for (var line in lines) {
      final padded = ' ' * padding + line.padRight(maxLength) + ' ' * padding;
      if (kDebugMode) print(_wrap(padded, color));
    }
    if (kDebugMode) print(_wrap(border, color));
  }
}
