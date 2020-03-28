import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  final Function toggleCallback;
  final Function deleteCallback;

  TaskTile({
    this.taskName,
    this.isDone,
    this.toggleCallback,
    this.deleteCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        deleteCallback();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Task deleted'),
        ));
      },
      onHorizontalDragEnd: (_) => toggleCallback(),
      child: ListTile(
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
          onChanged: (_) => toggleCallback(),
        ),
      ),
    );
  }
}
