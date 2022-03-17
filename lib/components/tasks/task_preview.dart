import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskPreview extends StatelessWidget {
  final Task task;
  final Function(Task) taskPressed;

  const TaskPreview({Key? key, required this.task, required this.taskPressed})
      : super(key: key);

  void onSelected() {
    taskPressed(task);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.content),
      onTap: onSelected,
    );
  }
}
