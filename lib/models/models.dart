class Todo {
  String? title;
  DateTime? deadline;
  DateTime? created;
  bool isDone;
  Todo({
    this.title,
    this.deadline,
    this.isDone = false,
    this.created,
  });

  void toggleIsDone() {
    isDone = !isDone;
  }

  factory Todo.fromRTDB(Map<String, dynamic> data) {
    return Todo(
      title: data['title'] ?? 'some task',
      isDone: data['isDone'] ?? false,
      // path: data['id'],
    );
  }
}
