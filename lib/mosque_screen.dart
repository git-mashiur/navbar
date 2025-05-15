import 'package:BottomNav/home_screen.dart';
import 'package:flutter/material.dart';

class MosqueScreen extends StatelessWidget {
  const MosqueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreenContent(
      title: 'Mosque Screen',
      route: '/mosque_details',
    );
  }
}