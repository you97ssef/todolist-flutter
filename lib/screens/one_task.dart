import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/task.dart';

class OneTask extends StatefulWidget {
  const OneTask({Key? key}) : super(key: key);

  static String route = '/one_task';

  @override
  _OneTaskState createState() => _OneTaskState();
}

class _OneTaskState extends State<OneTask> {
  late Task task;
  late bool completed;

  @override
  void initState() {
    super.initState();
  }

  void _updateTask(Task taskToUpdate, String content) {
    setState(() {
      // task.content = content;

      context.read<TasksCollection>().update(taskToUpdate, content);

      // Provider.of<TasksCollection>(context, listen: false).update(taskToUpdate, content);
    });
  }

  @override
  Widget build(BuildContext context) {
    task = ModalRoute.of(context)!.settings.arguments as Task;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Update Task",
          style: TextStyle(fontFamily: 'ShadowsIntroLight'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Text(
              'Content: ${task.content}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          TaskForm(
            submitForm: (value) {
              _updateTask(task, value);
            },
            buttonText: "Update Task",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                const Text(
                  'Done: ',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: task.completed,
                  onChanged: (value) {
                    setState(() {
                      task.completed = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
