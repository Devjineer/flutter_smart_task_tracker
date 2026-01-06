import 'package:flutter/material.dart';
import 'package:smart_task_tracker/models/task_models.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  // final VoidCallback onToggle;

  const TaskDetailScreen({
    super.key,
    required this.task,
    // required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text("Priority: ${task.priority}"),

            const SizedBox(height: 20),

            Row(
              children: [
                const Text("Completed"),
                const SizedBox(width: 10),
                Switch(
                  value: task.isCompleted,
                  onChanged: (_) {
                    // onToggle();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}