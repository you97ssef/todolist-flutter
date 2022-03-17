import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskDetails extends StatelessWidget {
  /*
  late Task task;
  late Function(Task) newTaskPressed;

  Task newTask() {
    return Task(Random().nextInt(10000), faker.lorem.sentence(),
        RandomGenerator().boolean(), DateTime.now());
  }

  TaskDetails({
    required this.newTaskPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        newTaskPressed.call(newTask());
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
  */

  final Task task;
  final Function() closeClicked;
  final Function() deleteClicked;
  final Function() updateClicked;

  const TaskDetails(
      {Key? key,
      required this.task,
      required this.closeClicked,
      required this.deleteClicked,
      required this.updateClicked})
      : super(key: key);

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
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed: updateClicked,
                icon: const Icon(Icons.update),
                label: const Text("Update"),
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: deleteClicked,
                icon: const Icon(Icons.delete),
                label: const Text("Delete"),
              ),
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
