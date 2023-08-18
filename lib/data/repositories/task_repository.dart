import 'package:mytaskmanager/data/data_mapper.dart';
import 'package:mytaskmanager/data/entities/entities.dart';
import 'package:mytaskmanager/data/local/task_dao.dart';
import 'package:mytaskmanager/utils/utils.dart';

class TaskRepository {
  final TaskDao _taskDao;

  TaskRepository({required TaskDao taskDao}) : _taskDao = taskDao;

  Future<TaskEntity> getAllTasks() async => TaskEntity(tasksList: []);

  Stream<TaskWithCategoryEntity> watchAllTasks() async* {
    TaskWithCategoryEntity(taskWithCategoryList: []);
  }

  Stream<TaskWithCategoryEntity> watchOnGoingTasks() async* {
     TaskWithCategoryEntity(taskWithCategoryList: []);
  }

  Stream<TaskWithCategoryEntity> watchCompletedTasks() async* {
    TaskWithCategoryEntity(taskWithCategoryList: []);
  }

  Stream<TaskWithCategoryEntity> watchAllTaskByCategory(int categoryId) async* {
    TaskWithCategoryEntity(taskWithCategoryList: []);
  }

  Stream<TaskWithCategoryEntity> watchAllTaskByStatus(
      StatusType statusType) async* {
    TaskWithCategoryEntity(taskWithCategoryList: []);
  }

  Stream<TaskWithCategoryEntity> watchAllTaskByDate(DateTime dateTime) async* {
    TaskWithCategoryEntity(taskWithCategoryList: []);
  }

  Stream<TaskWithCategoryEntity> searchTasks(String searchQuery) async* {
    TaskWithCategoryEntity(taskWithCategoryList: []);
  }

  Future<int> insertNewTask(TaskItemEntity item) async {
    return 0;
  }

  Future<bool> updateTask(TaskItemEntity item) async => false;

  Future<int> deleteTask(int id) async => 0;

  Future<TaskCategoryEntity> getAllTaskCategories() async =>
      TaskCategoryEntity(taskCategoryList: []);

  Stream<CategoryTotalTaskEntity> watchAllTaskCategories() async* {
    CategoryTotalTaskEntity(categoryTotalTaskList: []);
  }

  Future<int> insertNewCategory(TaskCategoryItemEntity newCategory) async => 0;

  Future<bool> updateCategory(TaskCategoryItemEntity updateCategory) async =>
      false;

  Future<int> deleteCategory(int id) async => 0;
}
