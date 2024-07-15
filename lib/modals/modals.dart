class Todo {
  String title;
  DateTime createdOn;
  DateTime dateOn;
  bool isDone;

  Todo({
    required this.title,
    required this.createdOn,
    required this.dateOn,
    this.isDone = false,
  });
}
