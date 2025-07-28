class Task {
  final int id;
  String title;
  String category;
  String createdAt;
  bool pinned;
  List taskList;

  Task({
    required this.id,
    required this.title,
    required this.taskList,
    this.category = "Work",
    String? createdAt,
    this.pinned = false,
  }) : createdAt = createdAt ??
            DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              DateTime.now().hour,
              DateTime.now().minute,
            ).toString().substring(0, 16);

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        createdAt: json["created_at"],
        pinned: json["pinned"],
        taskList: json["task_list"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "createdAt": createdAt.toString(),
        "pinned": pinned,
        "task_list": taskList,
      };
}
