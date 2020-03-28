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
            toggleCallback: () => taskData.toggleTask(taskData.tasks[index]),
            deleteCallback: () => taskData.removeTask(at: index),
          ),
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
