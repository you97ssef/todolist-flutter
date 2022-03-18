import 'package:flutter/material.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:provider/provider.dart';
import 'todolist.dart';
import 'package:todolist/models/task.dart';

Future<void> main() async {
  List<Task> tasks = await TasksCollection.getTasksFromApi();
  // runApp(TodoList(
  //   tasks: tasks,
  // ));
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => TasksCollection(tasks: tasks),
      // child: TodoList(tasks: tasks),
      child: const TodoList(/*tasks: tasks*/),
    ),
  );
}
