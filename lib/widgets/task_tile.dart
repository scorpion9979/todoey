import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  final Function callback;

  TaskTile({
    this.taskName,
    this.isDone,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskName,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isDone,
        onChanged: callback,
      ),
    );
  }
}
