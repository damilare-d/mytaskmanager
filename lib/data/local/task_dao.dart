import 'package:floor/floor.dart';
import 'package:mytaskmanager/data/entities/category_total_tasks_entity.dart';
import 'package:mytaskmanager/data/entities/task_category_entity.dart';
import 'package:mytaskmanager/data/entities/task_entity.dart';

import 'package:mytaskmanager/utils/utils.dart';



@dao
abstract class TaskDao {
  @Query('SELECT * FROM tasks')
  Future<List<TaskItemEntity>> getAllTasks();

  @Query('SELECT * FROM tasks ORDER BY deadline')
  Stream<List<TaskCategoryItemEntity>> watchAllTasks();

  @Query('SELECT * FROM tasks WHERE categoryId = :categoryId ORDER BY deadline')
  Stream<List<TaskCategoryItemEntity>> watchAllTaskByCategory(int categoryId);

  @Query('SELECT * FROM tasks WHERE isCompleted = :status ORDER BY deadline')
  Stream<List<TaskCategoryItemEntity>> watchAllTaskByStatus(StatusType status);

  @Query(
      'SELECT * FROM tasks WHERE strftime("%Y-%m-%d", deadline) = strftime("%Y-%m-%d", :dateTime) ORDER BY deadline')
  Stream<List<TaskCategoryItemEntity>> watchAllTaskByDate(DateTime dateTime);

  @Query('SELECT * FROM tasks WHERE title LIKE :searchQuery ORDER BY title')
  Stream<List<TaskCategoryItemEntity>> searchTasks(String searchQuery);

  @Query('SELECT * FROM tasks WHERE isCompleted = 0 ORDER BY deadline')
  Stream<List<TaskCategoryItemEntity>> watchOnGoingTask();

  @Query('SELECT * FROM tasks WHERE isCompleted = 1 ORDER BY deadline')
  Stream<List<TaskCategoryItemEntity>> watchCompletedTask();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNewTask(TaskItemEntity newTask);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTask(TaskItemEntity updateTask);

  @Query('DELETE FROM tasks WHERE id = :id')
  Future<void> deleteTask(int id);

  @Query('SELECT * FROM task_categories')
  Future<List<TaskCategoryItemEntity>> getAllTaskCategories();

  @Query(
      'SELECT task_categories.*, COUNT(tasks.id) AS totalTasks FROM task_categories LEFT JOIN tasks ON task_categories.id = tasks.categoryId GROUP BY task_categories.id')
  Stream<List<CategoryTotalTaskItemEntity>> watchAllTaskCategories();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNewCategory(TaskCategoryItemEntity newCategory);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateCategory(TaskCategoryItemEntity updateCategory);

  @Query('DELETE FROM task_categories WHERE id = :id')
  Future<void> deleteCategory(int id);

  @Query(
      'SELECT * FROM category_total_tasks WHERE taskCategoryId = :categoryId')
  Future<List<CategoryTotalTaskItemEntity>> getCategoryTotalTasks(
      int categoryId);
}
