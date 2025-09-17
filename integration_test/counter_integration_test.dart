import 'dart:io';
import 'package:flutter_allure_integration/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('Counter increments in integration test', (tester) async {
      // Load app widget.
        await tester.pumpWidget(const MyApp());

        // Verify that our counter starts at 0.
        expect(find.text('0'), findsOneWidget);
        expect(find.text('1'), findsNothing);

        // Tap the '+' icon and trigger a frame.
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();

        // Verify that our counter has incremented.
        expect(find.text('0'), findsNothing);
        expect(find.text('1'), findsOneWidget);


      // ✅ Save result to a file
      final subfolder = 'integration';
      final outDir = Directory(p.join(Directory.current.path, 'reports', 'results', subfolder))
        ..createSync(recursive: true);

      final logFile = File(p.join(outDir.path, 'integration_log.txt'))
        ..writeAsStringSync('Counter incremented to test validated');

      // ✅ Attach file
      print('event:attachment:${logFile.path}');

    });
  });
}
