class AppState {
  int _counter = 0;

  int get counter => _counter;

  set counter(int newValue) {
    _counter = newValue;
  }

  increment() {
    counter++;
  }
}
