import 'package:flutter/material.dart';

import 'entities/entities.dart';
import 'models/models.dart';

class DataMapper {
  static TaskEntity toTaskEntity(List<Task> tasks) => TaskEntity(
      tasksList: tasks
          .map((item) => TaskItemEntity(
              id: item.id,
              categoryId: item.categoryId,
              title: item.title,
              description: item.description,
              deadline: item.deadline,
              isCompleted: item.isCompleted))
          .toList());

  static TaskItemEntity toTaskItemEntity(Task task) => TaskItemEntity(
      id: task.id,
      categoryId: task.categoryId,
      title: task.title,
      description: task.description,
      deadline: task.deadline,
      isCompleted: task.isCompleted);

  static TaskWithCategoryEntity toTaskWithCategoryEntity(
          List<TaskWithCategory> taskWithCategory) =>
      TaskWithCategoryEntity(
          taskWithCategoryList: taskWithCategory
              .map((item) => TaskWithCategoryItemEntity(
                  taskItemEntity: toTaskItemEntity(item.task),
                  taskCategoryItemEntity:
                      toTaskCategoryItemEntity(item.taskCategory)))
              .toList());

  static CategoryTotalTaskEntity toCategoryTotalTaskEntity(
          List<CategoryTotalTask> categoryTotalTasks) =>
      CategoryTotalTaskEntity(
          categoryTotalTaskList: categoryTotalTasks
              .map((item) => CategoryTotalTaskItemEntity(
                    taskCategoryItemEntity:
                        toTaskCategoryItemEntity(item.category),
                    totalTasks: item.totalTasks,
                  ))
              .toList());

  static TasksCompanion toTask(TaskItemEntity item) => TasksCompanion.insert(
        1,categoryId: item.categoryId,
        title: item.title,
        description: item.description,
        deadline: item.deadline!,
        isCompleted: item.isCompleted,
      );

  static TasksCompanion toUpdatedTask(TaskItemEntity item) =>
      TasksCompanion.insert(
         item.id,
        categoryId: item.categoryId,
        title: item.title,
        description: item.description,
        deadline: item.deadline?? DateTime.now(),
        isCompleted: item.isCompleted,
      );

  static TaskCategoryEntity toTaskCategoryEntity(
          List<TaskCategory> categories) =>
      TaskCategoryEntity(
        taskCategoryList: categories
            .map(
              (item) => TaskCategoryItemEntity(
                id: item.id,
                title: item.title,
                gradient: LinearGradient(
                  colors: [
                    Color(item.startColor),
                    Color(item.endColor),
                  ],
                ),
              ),
            )
            .toList(),
      );

  static TaskCategoryItemEntity toTaskCategoryItemEntity(
          TaskCategory category) =>
      TaskCategoryItemEntity(
        id: category.id,
        title: category.title,
        gradient: LinearGradient(
          colors: [
            Color(category.startColor),
            Color(category.endColor),
          ],
        ),
      );

  static TaskCategoriesCompanion toCategory(TaskCategoryItemEntity item) =>
      TaskCategoriesCompanion.insert(
        title: item.title,
        startColor: item.gradient,
        endColor: item.gradient,
      );
}

class TaskCategoriesCompanion {
  String title;
  LinearGradient startColor;
  LinearGradient endColor;

  TaskCategoriesCompanion.insert(
      {required this.endColor, required this.startColor, required this.title});
}

class TasksCompanion {
  int? id;
  int categoryId;
  String title;
  String description;
  DateTime deadline;
  bool isCompleted;

  TasksCompanion(this.id,this.categoryId, this.deadline, this.description,
      this.isCompleted, this.title);

  TasksCompanion.insert(
    this.id,{
        required this.categoryId,
      required this.deadline,
      required this.description,
      required this.isCompleted,
      required this.title});
}
