import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/modules/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (_, taskData, child) {
        return ListView.builder(
          itemBuilder: (_, index) => TaskTile(
            taskName: taskData.tasks[index].title,
            isDone: taskData.tasks[index].isDone,
            callback: (_) => taskData.toggleTask(taskData.tasks[index]),
          ),
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
