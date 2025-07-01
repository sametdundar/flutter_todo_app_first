class Todo {
  String id;
  String title;
  bool isDone;

  Todo({required this.id, required this.title, this.isDone = false});

  static List<Todo> todolist() {
    return [
      Todo(id: "1", title: "Berbere Git", isDone: true),
      Todo(id: "2", title: "Domates Al"),
      Todo(id: "3", title: "asdasdsad", isDone: true),
      Todo(id: "4", title: "assadsda"),
      Todo(id: "5", title: "asdadssad", isDone: true),
    ];
  }
}
