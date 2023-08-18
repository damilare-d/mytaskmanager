class CategoryTotalTask {
  final TaskCategory category;
  final int totalTasks;

  CategoryTotalTask(this.category, this.totalTasks);
}

class TaskCategory {
  int id;
  String title;
  int startColor;
  int endColor;

  TaskCategory(
      {required this.endColor,
      required this.id,
      required this.startColor,
      required this.title});
}
