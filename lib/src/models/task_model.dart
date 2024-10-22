class Task {
  final String name;
  final String date;
  final String time;
  final String assignedTo;
  String status;

  Task({
    required this.name,
    required this.date,
    required this.time,
    required this.assignedTo,
    this.status = 'Pending',
  });
}
