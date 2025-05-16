import 'package:BottomNav/routing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_details.dart';
import 'quran_details.dart';
import 'tasbih_details.dart';
import 'mosque_details.dart';
import 'features_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final List<GlobalKey<NavigatorState>> navigatorKeys = const [
    GlobalObjectKey<NavigatorState>('home'),
    GlobalObjectKey<NavigatorState>('quran'),
    GlobalObjectKey<NavigatorState>('tasbih'),
    GlobalObjectKey<NavigatorState>('mosque'),
    GlobalObjectKey<NavigatorState>('features'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, currentIndex) {
        return WillPopScope(
          onWillPop: () async {
            final isFirstRouteInCurrentTab =
            !await navigatorKeys[currentIndex].currentState!.maybePop();
            return isFirstRouteInCurrentTab;
          },
          child: Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: List.generate(5, (index) {
                return Navigator(
                  key: navigatorKeys[index],
                  onGenerateRoute: (settings) {
                    Widget page;

                    if (settings.name == '/') {
                      switch (index) {
                        case 0:
                          page = const MainScreenContent(
                              title: 'Home Screen', route: '/home_details');
                          break;
                        case 1:
                          page = const MainScreenContent(
                              title: 'Quran Screen', route: '/quran_details');
                          break;
                        case 2:
                          page = const MainScreenContent(
                              title: 'Tasbih Screen', route: '/tasbih_details');
                          break;
                        case 3:
                          page = const MainScreenContent(
                              title: 'Mosque Screen', route: '/mosque_details');
                          break;
                        case 4:
                          page = const MainScreenContent(
                              title: 'Features Screen',
                              route: '/features_details');
                          break;
                        default:
                          page = const Text("Invalid tab");
                      }
                    } else {
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
                        default:
                          page = const Center(child: Text('Unknown route'));
                      }
                    }

                    return MaterialPageRoute(builder: (_) => page);
                  },
                );
              }),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                if (index != currentIndex) {
                  context.read<NavigationCubit>().updateIndex(index);
                } else {
                  // If tapping the current tab, pop to its first route
                  navigatorKeys[index]
                      .currentState!
                      .popUntil((route) => route.isFirst);
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/ic_home.png',
                    height: 24,
                    color: currentIndex == 0 ? Colors.purple : Colors.grey,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, color: Colors.red),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/ic_quran.png',
                    height: 24,
                    color: currentIndex == 1 ? Colors.purple : Colors.grey,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, color: Colors.red),
                  ),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/ic_tasbih.png',
                    height: 24,
                    color: currentIndex == 2 ? Colors.purple : Colors.grey,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, color: Colors.red),
                  ),
                  label: 'Tasbih',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/ic_mosque.png',
                    height: 24,
                    color: currentIndex == 3 ? Colors.purple : Colors.grey,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, color: Colors.red),
                  ),
                  label: 'Mosque',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/ic_features.png',
                    height: 24,
                    color: currentIndex == 4 ? Colors.purple : Colors.grey,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, color: Colors.red),
                  ),
                  label: 'Features',
                ),
              ],
              selectedItemColor: Colors.purple,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.normal),
              type: BottomNavigationBarType.fixed,
            ),
          ),
        );
      },
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
