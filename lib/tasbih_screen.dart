import 'package:BottomNav/home_screen.dart';
import 'package:flutter/material.dart';

class TasbihScreen extends StatelessWidget {
  const TasbihScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreenContent(
      title: 'Tasbih Screen',
      route: '/tasbih_details',
    );
  }
}