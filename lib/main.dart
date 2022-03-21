import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:provider/provider.dart';
import 'todolist.dart';
// import 'package:todolist/models/task.dart';

main() async {
  /* for fake data 
  // List<Task> tasks = await TasksCollection.getTasksFromApi();
  // runApp(TodoList(
  //   tasks: tasks,
  // ));
  */

  WidgetsFlutterBinding.ensureInitialized();

  // getting data from the config file
  var config = json.decode(await rootBundle.loadString('assets/config.json'));

  runApp(
    ChangeNotifierProvider(
      create: (context) => TasksCollection(tasks: [], apiUrl: config['apiUrl']),
      child: const TodoList(/* tasks: tasks */),
    ),
  );
}
