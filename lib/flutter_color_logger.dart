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
  static const red = '31';
  static const green = '32';
  static const yellow = '33';
  static const blue = '34';
  static const purple = '35';
  static const cyan = '36';
  static const white = '37';
  static const brightRed = '91';
  static const brightGreen = '92';
  static const brightYellow = '93';
  static const brightBlue = '94';
  static const brightPurple = '95';
  static const brightCyan = '96';

  // ----------------- Simple colored logs -----------------
  /// Prints the string in red color.
  get logRed => enableLogging ? (kDebugMode) ? _p(_wrap(this, red)) : null : null;

  /// Prints the string in green color.
  get logGreen => enableLogging ? _p(_wrap(this, green)) : null;

  /// Prints the string in yellow color.
  get logYellow => enableLogging ? _p(_wrap(this, yellow)) : null;

  /// Prints the string in blue color.
  get logBlue => enableLogging ? _p(_wrap(this, blue)) : null;

  /// Prints the string in purple color.
  get logPurple => enableLogging ? _p(_wrap(this, purple)) : null;

  /// Prints the string in cyan color.
  get logCyan => enableLogging ? _p(_wrap(this, cyan)) : null;

  /// Prints the string in white color.
  get logWhite => enableLogging ? _p(_wrap(this, white)) : null;

  /// Prints the string in bright red color.
  get logBrightRed => enableLogging ? _p(_wrap(this, brightRed)) : null;

  /// Prints the string in bright green color.
  get logBrightGreen => enableLogging ? _p(_wrap(this, brightGreen)) : null;

  /// Prints the string in bright yellow color.
  get logBrightYellow => enableLogging ? _p(_wrap(this, brightYellow)) : null;

  /// Prints the string in bright blue color.
  get logBrightBlue => enableLogging ? _p(_wrap(this, brightBlue)) : null;

  /// Prints the string in bright purple color.
  get logBrightPurple => enableLogging ? _p(_wrap(this, brightPurple)) : null;

  /// Prints the string in bright cyan color.
  get logBrightCyan => enableLogging ? _p(_wrap(this, brightCyan)) : null;

  // ----------------- Boxed / Fancy logs -----------------
  /// Prints the string inside a boxed log with green color.
  get logSuccess => enableLogging ? _logBox(color: brightGreen) : null;

  /// Prints the string inside a boxed log with red color.
  get logError => enableLogging ? _logBox(color: brightRed) : null;

  /// Prints the string inside a boxed log with yellow color.
  get logWarning => enableLogging ? _logBox(color: brightYellow) : null;

  /// Prints the string inside a boxed log with blue color.
  get logInfo => enableLogging ? _logBox(color: brightBlue) : null;

  /// Prints the string inside a boxed log with purple color.
  get logDebug => enableLogging ? _logBox(color: brightPurple) : null;

  /// Prints the string inside a boxed log with cyan color.
  get logCyanBox => enableLogging ? _logBox(color: brightCyan) : null;

  void _p(String code){
    if (kDebugMode){
      print(code);
    }
  }

  /// Internal method for printing boxed/fancy logs.
  ///
  /// [color] ANSI color code for the text and box.
  /// [padding] Spaces around the text inside the box (default 4).
  void _logBox({String color = brightGreen, int padding = 4}) {
    if (!enableLogging) return;
    if (!kDebugMode) return;

    final lines = split('\n');
    final maxLength = lines.map((l) => l.length).reduce((a, b) => a > b ? a : b);
    final totalLength = maxLength + padding * 2;
    final border = '═' * totalLength;

    if (kDebugMode) print(_wrap(border, color));
    for (var line in lines) {
      final padded = ' ' * padding + line.padRight(maxLength) + ' ' * padding;
      if (kDebugMode) {
        print(_wrap(padded, color));
      }
    }
    if (kDebugMode) print(_wrap(border, color));
  }
}
