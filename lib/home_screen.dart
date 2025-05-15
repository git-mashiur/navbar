import 'package:BottomNav/features_details.dart';
import 'package:BottomNav/features_screen.dart';
import 'package:BottomNav/home_details.dart';
import 'package:BottomNav/mosque_details.dart';
import 'package:BottomNav/mosque_screen.dart';
import 'package:BottomNav/quran_details.dart';
import 'package:BottomNav/quran_screen.dart';
import 'package:BottomNav/tasbih_details.dart';
import 'package:BottomNav/tasbih_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Tracks the selected tab
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: navigatorKey,
        onGenerateRoute: (settings) {
          late Widget page;
          // Main pages based on currentIndex
          switch (_currentIndex) {
            case 0:
              page = const HomeScreenContent();
              break;
            case 1:
              page = const QuranScreen();
              break;
            case 2:
              page = const TasbihScreen();
              break;
            case 3:
              page = const MosqueScreen();
              break;
            case 4:
              page = const FeaturesScreen();
              break;
            default:
              page = const HomeScreenContent();
          }

          // Detail pages based on route name
          switch (settings.name) {
            case '/home_details':
              page = const HomeDetails();
              break;
            case '/quran_details':
              page = const QuranDetails();
              break;
            case '/tasbih_details':
              page = const TasbihDetails();
              break;
            case '/mosque_details':
              page = const MosqueDetails();
              break;
            case '/features_details':
              page = const FeaturesDetails();
              break;
          }

          print('Current Index: $_currentIndex, Route: ${settings.name}'); // Debug print
          return MaterialPageRoute(builder: (_) => page);
        },
        onPopPage: (route, result) {
          if (route.didPop(result)) {
            setState(() {}); // Force rebuild after popping
          }
          return true;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (_currentIndex != index) {
            setState(() {
              _currentIndex = index; // Update the selected tab
            });
            if (navigatorKey.currentState != null) {
              navigatorKey.currentState!.popUntil((route) => route.isFirst);
              // Explicitly push the main page based on the new index
              navigatorKey.currentState!.pushNamed('/');
            }
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_home.png',
              height: 24,
              color: _currentIndex == 0 ? Colors.purple : Colors.grey,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_quran.png',
              height: 24,
              color: _currentIndex == 1 ? Colors.purple : Colors.grey,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_tasbih.png',
              height: 24,
              color: _currentIndex == 2 ? Colors.purple : Colors.grey,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
            ),
            label: 'Tasbih',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_mosque.png',
              height: 24,
              color: _currentIndex == 3 ? Colors.purple : Colors.grey,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
            ),
            label: 'Mosque',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_features.png',
              height: 24,
              color: _currentIndex == 4 ? Colors.purple : Colors.grey,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
            ),
            label: 'Features',
          ),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreenContent(
      title: 'Home Screen',
      route: '/home_details',
    );
  }
}

class MainScreenContent extends StatelessWidget {
  final String title;
  final String route;

  const MainScreenContent({
    Key? key,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed(route),
            child: Text('Go to ${title.split(' ')[0]} Details'),
          ),
        ],
      ),
    );
  }
}