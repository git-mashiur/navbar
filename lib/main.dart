import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}