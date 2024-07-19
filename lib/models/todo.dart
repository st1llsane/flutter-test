class Todo {
  final int id;
  final String taskName;
  final int isDone;

  Todo({required this.id, required this.taskName, required this.isDone});

  factory Todo.fromSqfliteDatabase(Map<String, dynamic> data) {
    return Todo(
      id: data['id'] as int,
      taskName: data['taskName'] as String,
      isDone: data['isDone'] as int,
    );
  }
}
