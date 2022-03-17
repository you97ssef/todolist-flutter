import 'dart:math';

import 'package:todolist/models/task.dart';

import 'package:faker/faker.dart';

class Tasks {
  List<Task> tasks = [];

  Tasks(int number) {
    var faker = Faker();
    tasks = List.generate(
        number,
        (task) => Task(Random().nextInt(10000), faker.lorem.sentence(),
            RandomGenerator().boolean(), DateTime.now()));
  }

  getTasks() {
    return tasks;
  }
}
