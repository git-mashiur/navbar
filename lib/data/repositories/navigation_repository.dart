class NavigationRepository {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (index < 0 || index > 4) {
      throw Exception('Index out of bounds');
    }
    _currentIndex = index;
  }
}