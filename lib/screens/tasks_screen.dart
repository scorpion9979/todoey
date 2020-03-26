import 'package:flutter/material.dart';

const tasks = [
  {'title': 'Buy milk', 'isDone': false},
  {'title': 'Buy eggs', 'isDone': false},
  {'title': 'Buy bread', 'isDone': true}
];

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
              40,
              50,
              40,
              25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.lightBlueAccent,
                  radius: 25,
                  child: Icon(
                    Icons.list,
                    size: 35,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '12 Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: ListView(
                  children: tasks
                      .map((task) => ListTile(
                            title: Text(
                              task['title'],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                decoration: task['isDone']
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            trailing: Checkbox(
                              value: task['isDone'],
                              onChanged: (newVal) => print(newVal),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                  onPressed: () {},
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
                  ));
        },
      ),
    );
  }
}
