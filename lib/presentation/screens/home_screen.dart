import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_state.dart';
import '../widgets/bottom_nav_bar.dar.dart';
import 'quran_screen.dart';
import 'tasbih_screen.dart';
import 'mosque_screen.dart';
import 'features_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> _screens = [
    const Center(child: Text('Home Screen')),
    const QuranScreen(),
    const TasbihScreen(),
    const MosqueScreen(),
    const FeaturesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: state.errorMessage != null
                ? Center(child: Text(state.errorMessage!))
                : _screens[state.currentIndex],
            bottomNavigationBar: CustomBottomNavBar(),
          );
        },
      ),
    );
  }
}