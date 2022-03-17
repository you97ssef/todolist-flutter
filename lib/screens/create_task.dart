import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/task.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({Key? key}) : super(key: key);

  static String route = '/create_task';

  void _addTask(String content, BuildContext context) {
    Task newTask = Task(1, content, false, DateTime.now());

    Provider.of<TasksCollection>(context, listen: false).create(newTask);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Task created!"),
    ));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Task",
          style: TextStyle(fontFamily: 'ShadowsIntroLight'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: Center(
              child: Text(
                'New Task',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          TaskForm(
            submitForm: (value) {
              _addTask(value, context);
            },
            buttonText: "Add new Task",
          ),
        ]),
      ),
    );
  }
}
