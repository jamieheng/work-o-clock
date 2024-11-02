import 'package:flutter/material.dart';
import 'package:work_o_clock/src/models/task_model.dart';
import 'package:work_o_clock/src/widgets/base_button.dart';

class EditTaskPopup extends StatelessWidget {
  final Task task;

  EditTaskPopup({required this.task});

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

  void _showEditTaskDialog(BuildContext context) {
    final _nameController = TextEditingController(text: task.name);
    final _descriptionController =
        TextEditingController(text: task.description);
    String _status = task.status;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Task Name
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Task Name'),
                ),
                const SizedBox(height: 16),

                // Description
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),

                // Status
                DropdownButtonFormField<String>(
                  value: _status,
                  decoration: const InputDecoration(labelText: 'Status'),
                  onChanged: (String? newStatus) {
                    if (newStatus != null) {
                      _status = newStatus;
                    }
                  },
                  items: ['Requesting', 'Pending', 'In Progress', 'Complete']
                      .map<DropdownMenuItem<String>>((String value) {
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
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Additional task details here...

            const Spacer(),
            // Action Buttons
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BaseButton(
                          onPressed: () => _showEditTaskDialog(context),
                          text: 'Edit Task',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: BaseButton(
                          onPressed: () {
                            // Delete action
                          },
                          text: 'Delete Task',
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
