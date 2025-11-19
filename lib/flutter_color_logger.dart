import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

/// Flutter Color Logger – A beautiful, colorful, and boxed logging extension for Flutter & Dart
///
/// This extension adds powerful and visually appealing logging capabilities directly
/// to all strings. It uses ANSI colors and draws elegant boxes in the console while
/// being completely safe for production (no `print()`, only `developer.log`).
///
/// Key features:
/// • 14 ANSI colors (normal + bright)
/// • Boxed logs with borders and automatic titles (SUCCESS, ERROR, etc.)
/// • Automatic timestamp on every log
/// • Custom log name/tag support (e.g. "API", "Auth", "Database")
/// • Full error & stack trace integration
/// • Only active in debug mode
/// • Zero usage of `print()` → fully compliant with `dart analyze` and pub.dev rules
///
/// Published under MIT License | Ready for pub.dev 1.0.0+
extension FlutterColorLogger on String {
  // =================================================================
  // Global Configuration
  // =================================================================

  /// Globally enable or disable all logging from this package
  /// Set to false to completely silence all logs (useful for release builds or testing)
  static bool enableLogging = true;

  /// Globally enable or disable ANSI color codes
  /// Set to false if you want clean logs (e.g. for log files, CI/CD, or terminals without color support)
  static bool enableAnsi = true;

  // =================================================================
  // ANSI Color Constants (private)
  // =================================================================

  static const String _red = '31';           // Normal red
  static const String _green = '32';         // Normal green
  static const String _yellow = '33';        // Normal yellow
  static const String _blue = '34';          // Normal blue
  static const String _purple = '35';        // Normal purple (magenta)
  static const String _cyan = '36';          // Normal cyan
  static const String _white = '37';         // Normal white

  static const String _brightRed = '91';     // Bright red
  static const String _brightGreen = '92';   // Bright green
  static const String _brightYellow = '93';  // Bright yellow
  static const String _brightBlue = '94';    // Bright blue
  static const String _brightPurple = '95';  // Bright purple
  static const String _brightCyan = '96';    // Bright cyan

  // =================================================================
  // Internal Helper: Wrap text with ANSI color (if enabled)
  // =================================================================

  /// Applies ANSI color code to text only if [enableAnsi] is true
  /// Otherwise returns plain text (safe for colorless environments)
  String _wrap(String text, String code) =>
      enableAnsi ? '\x1B[${code}m$text\x1B[0m' : text;

  // =================================================================
  // Core Logging Method (uses developer.log – safe & feature-rich)
  // =================================================================

  /// Internal logger that sends colored message to Flutter's developer timeline
  /// Includes timestamp, custom name, log level, error, and stack trace
  void _log(
      String message, {
        required String color,        // ANSI color code
        required String name,         // Log tag (e.g. "API", "Auth")
        int level = 800,              // 800 = INFO, 1000 = WARNING/ERROR
        Object? error,                // Optional exception object
        StackTrace? stackTrace,       // Optional stack trace
      }) {
    // Respect global and debug mode flags
    if (!enableLogging || !kDebugMode) return;

    developer.log(
      _wrap(message, color),      // Colored message
      time: DateTime.now(),       // Automatic timestamp
      name: name.isEmpty ? 'FlutterColorLogger' : name,
      level: level,
      error: error,
      stackTrace: stackTrace,
    );
  }

  // =================================================================
  // Simple Colored Logs (one-liners)
  // =================================================================

  void logRed({String name = ''}) => _log(this, color: _red, name: name);
  void logGreen({String name = ''}) => _log(this, color: _green, name: name);
  void logYellow({String name = ''}) => _log(this, color: _yellow, name: name);
  void logBlue({String name = ''}) => _log(this, color: _blue, name: name);
  void logPurple({String name = ''}) => _log(this, color: _purple, name: name);
  void logCyan({String name = ''}) => _log(this, color: _cyan, name: name);
  void logWhite({String name = ''}) => _log(this, color: _white, name: name);

  void logBrightRed({String name = ''}) => _log(this, color: _brightRed, name: name);
  void logBrightGreen({String name = ''}) => _log(this, color: _brightGreen, name: name);
  void logBrightYellow({String name = ''}) => _log(this, color: _brightYellow, name: name);
  void logBrightBlue({String name = ''}) => _log(this, color: _brightBlue, name: name);
  void logBrightPurple({String name = ''}) => _log(this, color: _brightPurple, name: name);
  void logBrightCyan({String name = ''}) => _log(this, color: _brightCyan, name: name);

  // =================================================================
  // Semantic Boxed Logs (with beautiful borders and titles)
  // =================================================================

  /// Green boxed log with "SUCCESS" title – perfect for positive outcomes
  void logSuccess({
    String name = 'Success',
    Object? error,
    StackTrace? stackTrace,
  }) => _logBox(
    color: _brightGreen,
    title: 'SUCCESS',
    name: name,
    error: error,
    stackTrace: stackTrace,
  );

  /// Red boxed log with "ERROR" title – ideal for exceptions
  void logError({
    String name = 'Error',
    Object? error,
    StackTrace? stackTrace,
  }) => _logBox(
    color: _brightRed,
    title: 'ERROR',
    name: name,
    level: 1000,
    error: error,
    stackTrace: stackTrace,
  );

  /// Yellow boxed log with "WARNING" title
  void logWarning({String name = 'Warning'}) => _logBox(
    color: _brightYellow,
    title: 'WARNING',
    name: name,
  );

  /// Blue boxed log with "INFO" title
  void logInfo({String name = 'Info'}) => _logBox(
    color: _brightBlue,
    title: 'INFO',
    name: name,
  );

  /// Purple boxed log with "DEBUG" title
  void logDebug({String name = 'Debug'}) => _logBox(
    color: _brightPurple,
    title: 'DEBUG',
    name: name,
  );

  /// Cyan boxed log (custom purpose)
  void logCyanBox({String name = 'Log'}) => _logBox(
    color: _brightCyan,
    title: 'LOG',
    name: name,
  );

  // =================================================================
  // Box Drawing Engine (core of fancy logs)
  // =================================================================

  /// Draws a fully colored and bordered box around the string
  /// Supports multi-line content and automatic width calculation
  void _logBox({
    required String color,        // ANSI color for text and border
    required String title,        // Title shown at the top (e.g. SUCCESS)
    required String name,         // Log tag/name
    int padding = 4,              // Horizontal padding inside box
    int level = 800,              // Log level
    Object? error,                // Optional error object
    StackTrace? stackTrace,       // Optional stack trace
  }) {
    if (!enableLogging || !kDebugMode) return;

    final lines = split('\n');
    if (lines.isEmpty) return;

    // Calculate maximum line length for consistent box width
    final contentLines = lines.map((l) => l.trim()).where((l) => l.isNotEmpty).toList();
    final maxLength = contentLines.isEmpty
        ? 0
        : contentLines.map((l) => l.length).reduce((a, b) => a > b ? a : b);

    final innerWidth = maxLength + padding * 2;
    final border = '═' * (innerWidth + 2); // +2 for side borders

    final c = color;
    final colored = enableAnsi ? '\x1B[${c}m' : '';
    final reset = enableAnsi ? '\x1B[0m' : '';

    // Top border
    _log('$colored╒$border╕$reset', color: c, name: name, level: level);

    // Title line
    final titleLine = ' $title '.padRight(innerWidth + 2);
    _log('$colored│$titleLine│$reset', color: c, name: name, level: level);

    // Title separator
    _log('$colored╞$border╡$reset', color: c, name: name, level: level);

    // Content lines
    for (var line in lines) {
      final padded = line.padRight(maxLength);
      _log('$colored│${' ' * padding}$padded${' ' * padding}│$reset',
          color: c, name: name, level: level);
    }

    // Bottom border (with error/stack if provided)
    _log('$colored╘$border╛$reset',
        color: c, name: name, level: level, error: error, stackTrace: stackTrace);
  }
}