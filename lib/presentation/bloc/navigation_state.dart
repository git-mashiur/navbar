import 'package:equatable/equatable.dart';
import '../../domain/entities/navigation_item.dart';

class NavigationState extends Equatable {
  final int currentIndex;
  final List<NavigationItem> navigationItems;
  final String? errorMessage;

  const NavigationState({
    required this.currentIndex,
    required this.navigationItems,
    this.errorMessage,
  });

  NavigationState copyWith({
    int? currentIndex,
    List<NavigationItem>? navigationItems,
    String? errorMessage,
  }) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      navigationItems: navigationItems ?? this.navigationItems,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [currentIndex, navigationItems, errorMessage];
}