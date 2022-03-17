import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/screens/create_task.dart';
// import 'package:todolist/models/task.dart';

class AllTasks extends StatefulWidget {
  // final List<Task> tasks;
  const AllTasks({
    Key? key,
    required this.title,
    /* required this.tasks */
  }) : super(key: key);

  final String title;

  static String route = "/all_tasks";

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  // late List<Task> tasks = context.watch<TasksCollection>().tasks;

  @override
  void initState() {
    super.initState();
    // tasks = widget.tasks;
    // tasks = context.read<TasksCollection>().tasks;
  }

  TaskMaster? tasksViewer;

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(builder: (context, taskCollection, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontFamily: 'ShadowsIntroLight'),
          ),
        ),
        body: const TaskMaster(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, CreateTask.route)
                  .then((_) => setState(() {}));
            },
            backgroundColor: Colors.red[900],
            child: const Icon(Icons.add)),
      );
    });
  }
}