import 'package:get_it/get_it.dart';
import '../../data/repositories/navigation_repository.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<NavigationRepository>(NavigationRepository());
}