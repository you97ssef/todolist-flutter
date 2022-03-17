import 'package:flutter/material.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:provider/provider.dart';
import 'todolist.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/data/tasks.dart';

void main() {
  List<Task> tasks = Tasks(10).getTasks();
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
