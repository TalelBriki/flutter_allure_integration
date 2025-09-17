import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  test('Counter increments', () {
    int counter = 0;
    counter++;

    expect(counter, 1);

    // ✅ Save result to a file
    final subfolder = 'unit';
    final outDir = Directory(p.join(Directory.current.path, 'reports', 'results', subfolder))
      ..createSync(recursive: true);

    final logFile = File(p.join(outDir.path, 'counter_log.txt'))
      ..writeAsStringSync('Counter incremented to $counter');

    // ✅ Attach file
    print('event:attachment:${logFile.path}');
  });
}
