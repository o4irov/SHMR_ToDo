class Task {
  int id;
  String title;
  String description;
  String status = 'in doing';
  String? importance;
  DateTime? deadline;

  Task({
    required this.id,
    required this.title,
    required this.description,
  });
}
