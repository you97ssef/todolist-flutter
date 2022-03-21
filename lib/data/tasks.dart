import 'dart:math';
import 'package:todolist/models/task.dart';
import 'package:faker/faker.dart';

class Tasks {
  List<Task> tasks = [];

  // generate a number of fake tasks
  Tasks(int number) {
    var faker = Faker();

    tasks = List.generate(
      number, // number of tasks to generate
      (task) => Task(
        Random().nextInt(10000),
        faker.lorem.sentence(),
        RandomGenerator().boolean(),
        DateTime.now(),
      ),
    );
  }

  getTasks() {
    return tasks;
  }
}
