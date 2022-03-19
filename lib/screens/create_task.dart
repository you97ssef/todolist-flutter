import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/task.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  static String route = '/create_task';

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  Future<void> _addTask(String content, BuildContext context) async {
    Task newTask = Task(context.read<TasksCollection>().tasks.length + 1,
        content, false, DateTime.now());

    if (await context.read<TasksCollection>().create(newTask)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Task created!"),
      ));

      Navigator.pop(context);
    }

    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Task",
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
