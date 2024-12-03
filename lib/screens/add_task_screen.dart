import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/models/task.dart';
import 'package:flutter_basic/providers/task_provider.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  AddTaskScreen({super.key});
  void _addTask(BuildContext context) {
    final taskText = _taskController.text;
    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).addTask(
        Task(id: DateTime.now().toString(), title: taskText, isDone: false),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(labelText: "Task"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => _addTask, child: const Text("Add Task"))
          ],
        ),
      ),
    );
  }
}
