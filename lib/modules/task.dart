class Task {
  final String title;
  bool isDone = false;
  Task({this.title});

  toggleDone() {
    isDone = !isDone;
  }
}
