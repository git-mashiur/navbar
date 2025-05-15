import 'package:BottomNav/home_screen.dart';
import 'package:flutter/material.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreenContent(
      title: 'Features Screen',
      route: '/features_details',
    );
  }
}