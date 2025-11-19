# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2025-11-19
- Initial fixed bug

## [0.0.3] - 2025-11-09
### Added
- Initial release of **FlutterColorLogger**.
- Added extension on `String` to print **colored logs** using ANSI codes.
- Support for **standard colors**: red, green, yellow, blue, purple, cyan, white.
- Support for **bright colors**: brightRed, brightGreen, brightYellow, brightBlue, brightPurple, brightCyan.
- Added **fancy boxed logs**: logSuccess, logError, logWarning, logInfo, logDebug, logCyanBox.
- Multi-line string support for boxed logs.
- Added **getter syntax** for all log types (no parentheses needed).
- Added **global flags**:
    - `FlutterColorLogger.enableLogging` — enable or disable all logs.
    - `FlutterColorLogger.enableAnsi` — enable or disable ANSI color codes.
- Logs are **printed only in debug mode** (`kDebugMode`).

### Changed
- N/A (first release)

### Fixed
- N/A (first release)

### Example Usage
```dart
FlutterColorLogger.enableLogging = true;
FlutterColorLogger.enableAnsi = true;

"This is a success message".logSuccess;
"An error occurred!".logError;
"Warning: Check input".logWarning;
"Info: Process completed".logInfo;
"Debug: x = 42".logDebug;
"Cyan box message".logCyanBox;

"This is red".logRed;
"This is bright green".logBrightGreen;
