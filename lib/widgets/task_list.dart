import 'package:flutter/material.dart';
import 'package:todoey/modules/task.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final Function callback;

  const TasksList({this.tasks, this.callback});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskTile(
        taskName: tasks[index].title,
        isDone: tasks[index].isDone,
        callback: (bool newVal) => callback(index),
      ),
      itemCount: tasks.length,
    );
  }
}
