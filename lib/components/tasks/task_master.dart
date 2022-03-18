import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_details.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/one_task.dart';

class TaskMaster extends StatefulWidget {
  const TaskMaster({Key? key, required this.tasks}) : super(key: key);
  final List<Task> tasks;

  @override
  State<TaskMaster> createState() => _TaskMasterState();
}

class _TaskMasterState extends State<TaskMaster> {
  Task? selectedTask;

  _showSnackBar(
      String questionMessage, String doneMessage, Function toDoAction) {
    var snackBar = SnackBar(
      content: Text(questionMessage),
      action: SnackBarAction(
        label: "Confirm",
        onPressed: () {
          toDoAction();
          setState(() {
            selectedTask = null;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(doneMessage),
          ));
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _selectedDetails(Task task) {
    setState(() {
      selectedTask = task;
    });
  }

  void _closeSelecetd() {
    setState(() {
      selectedTask = null;
    });
  }

  void _updateSelecetd() {
    Navigator.pushNamed(context, OneTask.route, arguments: selectedTask)
        .then((_) => setState(() {}));
    /*
    _showSnackBar("Update Task ?", "Task updated!", () {
      for (var task in widget.tasks) {
        if (selectedTask == task) {
          task.content = "updated";
          task.completed = !task.completed;
        }
      }
    });
    */
  }

  void _deleteSelecetd() {
    _showSnackBar("Delete Task ?", "Task deleted!", () {
      // widget.tasks.remove(selectedTask);
      // Provider.of<TasksCollection>(context, listen: false).delete(selectedTask);
      context.read<TasksCollection>().delete(selectedTask);
    });
  }

  Widget _showDetailsWhenProductIsSelected() {
    return (selectedTask != null)
        ? TaskDetails(
            task: selectedTask!,
            closeClicked: _closeSelecetd,
            updateClicked: _updateSelecetd,
            deleteClicked: _deleteSelecetd,
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _showDetailsWhenProductIsSelected(),
        Expanded(
          child: ListView.builder(
            itemCount: widget.tasks.length,
            itemBuilder: (context, index) {
              return TaskPreview(
                task: widget.tasks[index],
                taskPressed: _selectedDetails,
              );
            },
          ),
        ),
      ],
    );
  }
}
