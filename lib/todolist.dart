import 'package:flutter/material.dart';
import 'package:todolist/screens/all_tasks.dart';
import 'screens/create_task.dart';
import 'screens/one_task.dart';
// import 'package:todolist/models/task.dart'; // for fake data

class TodoList extends StatelessWidget {
  // final List<Task> tasks; // for fake data

  const TodoList({
    Key? key,
    /* required this.tasks */ // for fake data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do list',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Colors.red[900]),
      ),
      home: const AllTasks(
        title: 'Todo List',
        // tasks: tasks, // for fake data
      ),
      routes: {
        AllTasks.route: (context) => const AllTasks(title: 'Todo List'),
        OneTask.route: (context) => const OneTask(),
        CreateTask.route: (context) => const CreateTask(),
      },
    );
  }
}
