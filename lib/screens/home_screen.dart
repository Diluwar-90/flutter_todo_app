import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/providers/task_provider.dart';
import 'package:flutter_basic/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (ctx, index) {
            final task = tasks[index];
            return TaskTile(
                title: task.title, isDone: task.isDone, onChanged: (value) {});
          }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamed("/add_task");
      },
      child: const Icon(Icons.add),),
    );
  }
}
