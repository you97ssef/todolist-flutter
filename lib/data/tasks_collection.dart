import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/models/task.dart';

class TasksCollection extends ChangeNotifier {
  final List<Task> tasks;
  bool gotApiData = false;
  
  TasksCollection({required this.tasks});

  create(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  update(Task taskToUpdate, String content) {
    for (var task in tasks) {
      if (taskToUpdate == task) {
        task.content = content;
      }
    }
    notifyListeners();
  }

  delete(Task? taskToDelete) {
    tasks.remove(taskToDelete);
    notifyListeners();
  }

  getTasksFromApi() async {
    var todos = await Dio().get("https://jsonplaceholder.typicode.com/todos");

    for (var todo in todos.data) {
      tasks.add(Task.fromJson(todo));
    }

    gotApiData = true;

    return tasks;
  }
}
