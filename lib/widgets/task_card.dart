import 'package:flutter/material.dart';
import 'package:smart_task_tracker/models/task_models.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  const TaskCard({super.key, required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: task.isCompleted ? Colors.grey : null,
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            color: task.isCompleted ? const Color.fromARGB(255, 39, 39, 39) : Colors.white,
          ),
        ),
        subtitle: Text(
          "Priority: ${task.priority}",
          style: TextStyle(
            color: task.priority == 'Medium'
                ? Colors.deepOrange
                : task.priority == 'High'
                ? Colors.red
                : Colors.green,
          ),
        ),
        trailing: Transform.scale(
          scale: 0.5,
          child: Switch(value: task.isCompleted, onChanged: (_) => onToggle()),
        ),
      ),
    );
  }
}
