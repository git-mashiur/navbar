abstract class NavigationEvent {}

class ChangeNavigationEvent extends NavigationEvent {
  final int index;

  ChangeNavigationEvent(this.index);
}