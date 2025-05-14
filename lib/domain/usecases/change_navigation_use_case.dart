class ChangeNavigationUseCase {
  final Function(int) onNavigationChanged;

  ChangeNavigationUseCase(this.onNavigationChanged);

  void execute(int index) {
    if (index < 0 || index > 4) {
      throw Exception('Invalid navigation index');
    }
    onNavigationChanged(index);
  }
}