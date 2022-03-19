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

  void _updateTask(int id, String content, bool completed) async {
    if (await context.read<TasksCollection>().update(id, content, completed)) {
      setState(() {
        // task.content = content;
        // Provider.of<TasksCollection>(context, listen: false).update(taskToUpdate, content);
      });
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
              'Cant modify added task because its not really added. the server return 500 error'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
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
              _updateTask(task.id, value, task.completed);
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
                    _updateTask(task.id, task.content, value);
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
