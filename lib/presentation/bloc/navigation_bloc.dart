import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/navigation_constants.dart';
import '../../core/di/dependency_injection.dart';
import '../../data/repositories/navigation_repository.dart';
import '../../domain/entities/navigation_item.dart';
import '../../domain/usecases/change_navigation_use_case.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final NavigationRepository _repository = getIt<NavigationRepository>();
  late ChangeNavigationUseCase _useCase;

  NavigationBloc()
      : super(NavigationState(
      currentIndex: 0,
      navigationItems: NavigationConstants.navigationItems
          .map((item) => NavigationItem(item['label'], item['icon'], item['index']))
          .toList(),
      errorMessage: null)) {
    _useCase = ChangeNavigationUseCase((index) {
      try {
        _repository.setIndex(index);
        emit(state.copyWith(currentIndex: index, errorMessage: null));
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString()));
      }
    });

    on<ChangeNavigationEvent>((event, emit) {
      try {
        _useCase.execute(event.index);
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString()));
      }
    });
  }
}