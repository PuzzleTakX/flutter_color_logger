# FlutterColorLogger

**FlutterColorLogger** is a Dart/Flutter extension that allows you to print **colorful console logs** and **fancy boxed messages** directly from strings. It is ideal for **debugging and development**, making your logs easier to read and visually organized.

---

## Features

- Standard and bright ANSI colors
- Fancy boxed logs with `═` lines
- Multi-line support
- Enable/disable ANSI colors globally (`enableAnsi`)
- Enable/disable all logs globally (`enableLogging`)
- Logs are only printed in **debug mode** (`kDebugMode`)
- Simple usage with **getter syntax** (no parentheses required)

---

## Usage

### Enable/Disable Logging

```dart
// Enable or disable all logging
FlutterColorLogger.enableLogging = true;

// Enable or disable ANSI colors
FlutterColorLogger.enableAnsi = true;

"This is red".logRed;
"This is green".logGreen;
"This is yellow".logYellow;
"This is blue".logBlue;
"This is purple".logPurple;
"This is cyan".logCyan;
```

### Bright Colored Logs

```dart
"This is bright red".logBrightRed;
"This is bright green".logBrightGreen;
"This is bright blue".logBrightBlue;
```
### Fancy Boxed Logs

```dart
"Success: Task completed".logSuccess;
"Error occurred!".logError;
"Warning: Check input".logWarning;
"Info: Process completed".logInfo;
"Debug: x = 42".logDebug;
"Cyan box message".logCyanBox;
```

# Notes

`Logs only appear in debug mode (kDebugMode) and are suppressed in release builds.`

`To print logs without colors, set FlutterColorLogger.enableAnsi = false.`

`All logs use getter syntax, so you do not need parentheses ().`

### Example

```dart
import 'package:flutter/foundation.dart';
import 'flutter_color_logger.dart';

void main() {
  // Enable logs and colors
  FlutterColorLogger.enableLogging = true;
  FlutterColorLogger.enableAnsi = true;

  "This is a success message".logSuccess;
  "An error occurred!".logError;
  "Warning: Check input".logWarning;
  "Info: Process complete".logInfo;
  "Debug: x = 42".logDebug;
  "Cyan box message".logCyanBox;

  "Red text only".logRed;
  "Bright green text".logBrightGreen;
}
```