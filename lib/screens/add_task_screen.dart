import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/modules/task.dart';
import 'package:todoey/modules/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (_, taskData, child) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              color: Color(0xff757575),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Add Task',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 22,
                        ),
                      ),
                      TextField(
                        controller: controller,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                        color: Colors.lightBlueAccent,
                        onPressed: () {
                          if (controller.text.length > 0) {
                            taskData.addTask(Task(title: controller.text));
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
