import 'package:flutter/material.dart';
import 'package:flutter_color_logger/flutter_color_logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Logger Demo',
      home: const LoggerDemoPage(),
    );
  }
}

class LoggerDemoPage extends StatelessWidget {
  const LoggerDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlutterColorLogger Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Simple Colored Logs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => "This is red".logRed,
                  child: const Text('Red'),
                ),
                ElevatedButton(
                  onPressed: () => "This is green".logGreen,
                  child: const Text('Green'),
                ),
                ElevatedButton(
                  onPressed: () => "This is yellow".logYellow,
                  child: const Text('Yellow'),
                ),
                ElevatedButton(
                  onPressed: () => "This is blue".logBlue,
                  child: const Text('Blue'),
                ),
                ElevatedButton(
                  onPressed: () => "This is purple".logPurple,
                  child: const Text('Purple'),
                ),
                ElevatedButton(
                  onPressed: () => "This is cyan".logCyan,
                  child: const Text('Cyan'),
                ),
              ],
            ),
            const Divider(height: 32),
            const Text(
              'Boxed / Fancy Logs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => "Operation successful".logSuccess,
                  child: const Text('Success'),
                ),
                ElevatedButton(
                  onPressed: () => "Something went wrong".logError,
                  child: const Text('Error'),
                ),
                ElevatedButton(
                  onPressed: () => "Check input values".logWarning,
                  child: const Text('Warning'),
                ),
                ElevatedButton(
                  onPressed: () => "Fetching user info".logInfo,
                  child: const Text('Info'),
                ),
                ElevatedButton(
                  onPressed: () => "Debugging variable x".logDebug,
                  child: const Text('Debug'),
                ),
                ElevatedButton(
                  onPressed: () => "Custom cyan message".logCyanBox,
                  child: const Text('Cyan Box'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
