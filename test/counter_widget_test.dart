import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import 'package:flutter_allure_integration/counter_widget.dart';

void main() {
  testWidgets('CounterWidget increments when tapped', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CounterWidget()));

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    // ✅ Save test log as file
    final subfolder = 'widget';
    final outDir = Directory(p.join(Directory.current.path, 'reports', 'failures', subfolder))
      ..createSync(recursive: true);

    final logFile = File(p.join(outDir.path, 'widget_log.txt'))
      ..writeAsStringSync('Widget test passed ✅ Counter=1');

    print('event:attachment:${logFile.path}');
  });
}
