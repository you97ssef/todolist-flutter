import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/models/task.dart';

class TasksCollection extends ChangeNotifier {
  final List<Task> tasks;
  bool gotApiData = false;

  TasksCollection({required this.tasks});

  Future<bool> create(Task newTask) async {
    // tasks.add(newTask);
    // notifyListeners();

    var response = await Dio().post(
        "https://jsonplaceholder.typicode.com/todos",
        data: newTask.toJson());

    if (response.statusCode == 201) {
      tasks.add(Task.fromJson(response.data));

      notifyListeners();
      return true;
    }

    return false;
  }

  Future<bool> update(int id, String content, bool completed) async {
    Task taskNewData = Task(id, content, completed, DateTime.now());

    var response = await Dio().put(
      "https://jsonplaceholder.typicode.com/todos/" + id.toString(),
      data: taskNewData.toJson(),
    );

    if (response.statusCode == 200) {
      for (var task in tasks) {
        if (id == task.id) {
          task.content = content;
          task.completed = completed;
        }
      }

      notifyListeners();
      return true;
    }

    return false;
  }

  Future<bool> delete(Task taskToDelete) async {
    var response = await Dio().delete(
      "https://jsonplaceholder.typicode.com/todos/" +
          taskToDelete.id.toString(),
    );

    if (response.statusCode == 200) {
      tasks.remove(taskToDelete);

      notifyListeners();
      return true;
    }

    return false;
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
