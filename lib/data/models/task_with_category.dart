

import 'models.dart';

class TaskWithCategory {
  final Task task;
  final TaskCategory taskCategory;

  TaskWithCategory(this.task, this.taskCategory);
}

class Task {
  int id;
  int categoryId;
  String title;
  String description;
  DateTime deadline;  
  bool isCompleted;

  Task(this.categoryId, this.deadline, this.description, this.id,
      this.isCompleted, this.title);
}
