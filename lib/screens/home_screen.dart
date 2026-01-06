import 'package:flutter/material.dart';
import 'package:smart_task_tracker/models/task_models.dart';
import 'package:smart_task_tracker/screens/task_detail_screen.dart';
import 'package:smart_task_tracker/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> tasks = [
    Task(
      id: 1,
      title: "Complete math assignment",
      isCompleted: false,
      priority: "High",
    ),
    Task(id: 2, title: "Clean my room", isCompleted: true, priority: "Low"),
    Task(
      id: 3,
      title: "Study Flutter widgets",
      isCompleted: false,
      priority: "Medium",
    ),
    Task(
      id: 4,
      title: "Prepare for test",
      isCompleted: false,
      priority: "High",
    ),
  ];

  void toggleTask(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: tasks.length,
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        // if (index.isOdd) return Divider();

        // debugPrint('${index ~/ 2}');

        return _buildRow(tasks[index], index);
      },
    );
  }

  Widget _buildRow(Task task, index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskDetailScreen(task: task)),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: TaskCard(task: task, onToggle: () => toggleTask(index)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks")),
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      ),
      body: _buildList(),
    );
  }
}
