
import 'package:mytaskmanager/data/entities/entities.dart';
import 'package:mytaskmanager/utils/utils.dart';

class DummyData {
  static TaskCategoryEntity getTaskCategoryEntity() =>
      TaskCategoryEntity(taskCategoryList: [
        TaskCategoryItemEntity(
          title: "On Going",
          gradient: AppTheme.blueGradient,
        ),
        TaskCategoryItemEntity(
          title: "Done",
          gradient: AppTheme.purpleGradient,
        ),
      ]);
}
