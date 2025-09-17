import 'package:flutter/material.dart';

import 'counter_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: const  CounterScreen(title: 'Counter App Home Page'),
    );
  }
}
