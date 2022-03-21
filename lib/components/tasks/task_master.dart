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
    String questionMessage, // Message to show for confirmation
    String doneMessage, // Message after confirmation
    Function toDoAction, // Function to do if confirm is clicked
  ) {
    var snackBar = SnackBar(
      content: Text(questionMessage),
      action: SnackBarAction(
        label: 'Confirm',
        onPressed: () async {
          if (await toDoAction()) {
            setState(() {
              selectedTask = null;
            });

            // show confirm message
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(doneMessage),
            ));
          }
        },
      ),
    );

    // show confirmation question
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // selecting a task
  void _selectedDetails(Task task) {
    setState(() {
      selectedTask = task;
    });
  }

  // clearing the selected task
  void _closeSelecetd() {
    setState(() {
      selectedTask = null;
    });
  }

  void _updateSelecetd() {
    // go to update task screen
    Navigator.pushNamed(
      context,
      OneTask.route,
      arguments: selectedTask,
    ).then((_) => setState(() {}));
  }

  // deleting a task
  void _deleteSelecetd() {
    _showSnackBar('Delete Task ?', 'Task deleted!', () async {
      return await context.read<TasksCollection>().delete(selectedTask!);
    });
  }

  // show task details
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
          child:
              Consumer<TasksCollection>(builder: (context, taskCollection, _) {
            return ListView.builder(
              itemCount: widget.tasks.length,
              itemBuilder: (context, index) {
                return TaskPreview(
                  task: widget.tasks[index],
                  taskPressed: _selectedDetails,
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
