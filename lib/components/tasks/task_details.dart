import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  final Function() closeClicked;
  final Function() deleteClicked;
  final Function() updateClicked;

  const TaskDetails({
    Key? key,
    required this.task,
    required this.closeClicked,
    required this.deleteClicked,
    required this.updateClicked,
  }) : super(key: key);

  _button(Color color, String label, Function onPressed) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: color,
      ),
      onPressed: onPressed(),
      icon: const Icon(Icons.update),
      label: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: task.completed == true ? Colors.green[900] : Colors.red[900],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: task.completed == true
                ? const Icon(Icons.done)
                : const Icon(Icons.close),
            iconColor: task.completed == true ? Colors.green : Colors.red,
            title: Text(task.content),
            subtitle: Text(task.createdAt.toString()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _button(Colors.yellow, 'Update', updateClicked),
              _button(Colors.red, 'Delete', deleteClicked),
              TextButton(
                child: const Icon(Icons.close),
                onPressed: closeClicked,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
