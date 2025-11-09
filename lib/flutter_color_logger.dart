import 'package:flutter/foundation.dart';

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
  /// ANSI code for red color.
  static const red = '31';

  /// ANSI code for green color.
  static const green = '32';

  /// ANSI code for yellow color.
  static const yellow = '33';

  /// ANSI code for blue color.
  static const blue = '34';

  /// ANSI code for purple color.
  static const purple = '35';

  /// ANSI code for cyan color.
  static const cyan = '36';

  /// ANSI code for white color.
  static const white = '37';

  /// ANSI code for bright red color.
  static const brightRed = '91';

  /// ANSI code for bright green color.
  static const brightGreen = '92';

  /// ANSI code for bright yellow color.
  static const brightYellow = '93';

  /// ANSI code for bright blue color.
  static const brightBlue = '94';

  /// ANSI code for bright purple color.
  static const brightPurple = '95';

  /// ANSI code for bright cyan color.
  static const brightCyan = '96';

  // ----------------- Simple colored logs -----------------
  /// Prints the string in red color.
  void get logRed => enableLogging && kDebugMode ? _p(_wrap(this, red)) : null;

  /// Prints the string in green color.
  void get logGreen =>
      enableLogging && kDebugMode ? _p(_wrap(this, green)) : null;

  /// Prints the string in yellow color.
  void get logYellow =>
      enableLogging && kDebugMode ? _p(_wrap(this, yellow)) : null;

  /// Prints the string in blue color.
  void get logBlue =>
      enableLogging && kDebugMode ? _p(_wrap(this, blue)) : null;

  /// Prints the string in purple color.
  void get logPurple =>
      enableLogging && kDebugMode ? _p(_wrap(this, purple)) : null;

  /// Prints the string in cyan color.
  void get logCyan =>
      enableLogging && kDebugMode ? _p(_wrap(this, cyan)) : null;

  /// Prints the string in white color.
  void get logWhite =>
      enableLogging && kDebugMode ? _p(_wrap(this, white)) : null;

  /// Prints the string in bright red color.
  void get logBrightRed =>
      enableLogging && kDebugMode ? _p(_wrap(this, brightRed)) : null;

  /// Prints the string in bright green color.
  void get logBrightGreen =>
      enableLogging && kDebugMode ? _p(_wrap(this, brightGreen)) : null;

  /// Prints the string in bright yellow color.
  void get logBrightYellow =>
      enableLogging && kDebugMode ? _p(_wrap(this, brightYellow)) : null;

  /// Prints the string in bright blue color.
  void get logBrightBlue =>
      enableLogging && kDebugMode ? _p(_wrap(this, brightBlue)) : null;

  /// Prints the string in bright purple color.
  void get logBrightPurple =>
      enableLogging && kDebugMode ? _p(_wrap(this, brightPurple)) : null;

  /// Prints the string in bright cyan color.
  void get logBrightCyan =>
      enableLogging && kDebugMode ? _p(_wrap(this, brightCyan)) : null;

  // ----------------- Boxed / Fancy logs -----------------
  /// Prints the string inside a boxed log with green color.
  void get logSuccess =>
      enableLogging && kDebugMode ? _logBox(color: brightGreen) : null;

  /// Prints the string inside a boxed log with red color.
  void get logError =>
      enableLogging && kDebugMode ? _logBox(color: brightRed) : null;

  /// Prints the string inside a boxed log with yellow color.
  void get logWarning =>
      enableLogging && kDebugMode ? _logBox(color: brightYellow) : null;

  /// Prints the string inside a boxed log with blue color.
  void get logInfo =>
      enableLogging && kDebugMode ? _logBox(color: brightBlue) : null;

  /// Prints the string inside a boxed log with purple color.
  void get logDebug =>
      enableLogging && kDebugMode ? _logBox(color: brightPurple) : null;

  /// Prints the string inside a boxed log with cyan color.
  void get logCyanBox =>
      enableLogging && kDebugMode ? _logBox(color: brightCyan) : null;

  /// Internal method for printing a colored string.
  void _p(String code) {
    if (kDebugMode) {
      print(code);
    }
  }

  /// Internal method for printing boxed/fancy logs.
  ///
  /// [color] ANSI color code for the text and box.
  /// [padding] Spaces around the text inside the box (default 4).
  void _logBox({String color = brightGreen, int padding = 4}) {
    if (!enableLogging || !kDebugMode) return;

    final lines = split('\n');
    final maxLength =
        lines.map((l) => l.length).reduce((a, b) => a > b ? a : b);
    final totalLength = maxLength + padding * 2;
    final border = '═' * totalLength;

    print(_wrap(border, color));
    for (var line in lines) {
      final padded = ' ' * padding + line.padRight(maxLength) + ' ' * padding;
      print(_wrap(padded, color));
    }
    print(_wrap(border, color));
  }
}
