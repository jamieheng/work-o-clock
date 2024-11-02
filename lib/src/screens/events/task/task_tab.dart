import 'package:flutter/material.dart';
import 'package:work_o_clock/src/models/task_model.dart';
import 'package:work_o_clock/src/screens/events/task/task_detail_screen.dart';
//import 'package:work_o_clock/src/utils/generate_light_colors.dart';

class TaskTab extends StatefulWidget {
  @override
  _TaskTabState createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  final List<Task> tasks = [
    Task(
      name: 'Design Mockup',
      date: '2024-09-26',
      time: '10:00 AM',
      assignedTo: 'Alice Johnson',
      status: 'Requesting',
      description:
          "Develop a high-fidelity design mock-up for the APP project, which will serve as the visual foundation for both client presentations and the initial development phase. The mock-up should reflect the project's branding guidelines, including color schemes, typography, and visual hierarchy, and it should illustrate a cohesive user experience across key screens.",
      createdAt: '8:23 AM 2024-09-19',
    ),
    Task(
      name: 'Implement API',
      date: '2024-09-27',
      time: '2:00 PM',
      assignedTo: 'Bob Smith',
      status: 'In Progress',
      description:
          "Develop a high-fidelity design mock-up for the APP project, which will serve as the visual foundation for both client presentations and the initial development phase. The mock-up should reflect the project's branding guidelines, including color schemes, typography, and visual hierarchy, and it should illustrate a cohesive user experience across key screens.",
      createdAt: '8:23 AM 2024-09-19',
    ),
    Task(
      name: 'Review Code',
      date: '2024-09-28',
      time: '1:00 PM',
      assignedTo: 'Charlie Brown',
      status: 'Complete',
      description:
          "Develop a high-fidelity design mock-up for the APP project, which will serve as the visual foundation for both client presentations and the initial development phase. The mock-up should reflect the project's branding guidelines, including color schemes, typography, and visual hierarchy, and it should illustrate a cohesive user experience across key screens.",
      createdAt: '8:23 AM 2024-09-19',
    ),
    Task(
      name: 'Update Notification Screens UI',
      date: '2024-09-28',
      time: '1:00 PM',
      assignedTo: 'Hoshi Hae',
      status: 'Pending',
      description:
          "Develop a high-fidelity design mock-up for the APP project, which will serve as the visual foundation for both client presentations and the initial development phase. The mock-up should reflect the project's branding guidelines, including color schemes, typography, and visual hierarchy, and it should illustrate a cohesive user experience across key screens.",
      createdAt: '8:23 AM 2024-09-19',
    ),
  ];

  // List to store colors for each task
  late List<Color> taskColors;

  @override
  void initState() {
    super.initState();
  }

  // Method to get flag icons based on task status
  Icon _getStatusIcon(String status) {
    switch (status) {
      case 'Requesting':
        return const Icon(Icons.flag, color: Colors.yellow);
      case 'Pending':
        return const Icon(Icons.flag, color: Colors.orange);
      case 'In Progress':
        return const Icon(Icons.flag, color: Colors.blue);
      case 'Complete':
        return const Icon(Icons.flag, color: Colors.green);
      default:
        return const Icon(Icons.flag, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "Today's Tasks",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                // color: taskColors[index], // Use the pre-assigned color
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        task.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Date: ${task.date}\nTime: ${task.time}'),
                      trailing: DropdownButton<String>(
                        value: task.status,
                        onChanged: (String? newStatus) {
                          setState(() {
                            task.status = newStatus!;
                          });
                        },
                        items: [
                          'Requesting',
                          'Pending',
                          'In Progress',
                          'Complete'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                _getStatusIcon(value),
                                const SizedBox(width: 8),
                                Text(value),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskDetailScreen(task: task),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 12.0, left: 16.0, right: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            "Assigned to: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          CircleAvatar(
                            child: Text(task.assignedTo[0]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
