import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_state.dart';

class NavigationBloc extends Cubit<NavigationState> {
  NavigationBloc() : super(const NavigationState(currentIndex: 0));

  void changeIndex(int index) {
    if (index >= 0 && index < 5) {
      emit(NavigationState(currentIndex: index));
    }
  }
}