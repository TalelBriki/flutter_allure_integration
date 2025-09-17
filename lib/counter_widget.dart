import 'package:flutter/material.dart';
import 'counter.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text('${_counter.value}', key: const Key('counterText')),
            ElevatedButton(
              key: const Key('incrementButton'),
              onPressed: () {
                setState(() => _counter.increment());
              },
              child: const Text('Increment'),
            )
          ],
        ),
      ),
    );
  }
}
