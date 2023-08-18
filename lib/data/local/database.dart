import 'package:floor/floor.dart';
import 'package:mytaskmanager/data/entities/category_total_tasks_entity.dart';
import 'package:mytaskmanager/data/entities/task_category_entity.dart';
import 'package:mytaskmanager/data/entities/task_entity.dart';
import 'package:mytaskmanager/data/entities/task_with_category_entity.dart';
import 'package:mytaskmanager/data/local/task_dao.dart';


//part 'database.g.dart'; // Generated code will be placed here

@Database(version: 1, entities: [
  TaskEntity,
  TaskItemEntity,
  TaskCategoryEntity,
  TaskCategoryItemEntity,
  CategoryTotalTaskItemEntity,
  TaskWithCategoryEntity,
  TaskWithCategoryItemEntity,
])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao; // Use your corresponding DAO class here
}
