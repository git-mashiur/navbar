import 'package:BottomNav/home_screen.dart';
import 'package:flutter/material.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreenContent(
      title: 'Quran Screen',
      route: '/quran_details',
    );
  }
}