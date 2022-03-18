import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/models/task.dart';

class TasksCollection extends ChangeNotifier {
  late List<Task> tasks;
  TasksCollection(/*{required this.tasks}*/);

  fileTasks(List<Task> tasksFromApi){
    tasks = tasksFromApi;
  }

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

  static getTasksFromApi() async {
    var todos = await Dio().get("https://jsonplaceholder.typicode.com/todos");

    List<Task> tasks = [];

    for (var todo in todos.data) {
      tasks.add(Task.fromJson(todo));
    }

    return tasks;
  }
}
