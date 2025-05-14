import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';
import '../bloc/navigation_state.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state.currentIndex,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          onTap: (index) {
            context.read<NavigationBloc>().add(ChangeNavigationEvent(index));
          },
          items: state.navigationItems.map((item) {
            return BottomNavigationBarItem(
              icon: Image.asset(
                item.iconPath,
                height: 24,
                color: state.currentIndex == item.index ? Colors.purple : Colors.grey,
              ),
              label: item.label,
            );
          }).toList(),
        );
      },
    );
  }
}