class Task {
  final String name;
  final String date;
  final String time;
  final String assignedTo;
  final String description;
  final String createdAt;
  String status;

  Task({
    required this.name,
    required this.date,
    required this.time,
    required this.assignedTo,
    required this.description,
    required this.createdAt,
    this.status = 'Pending',
  });
}
