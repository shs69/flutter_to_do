class Task {
  final int id;
  String title;
  String category;
  String createdAt;
  bool pinned;

  Task({
    required this.id,
    required this.title,
    this.category = "Work",
    String? createdAt,
    this.pinned = false,
  }) : createdAt = createdAt ??
            DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              DateTime.now().hour,
              DateTime.now().second,
            ).toString().substring(0, 16);

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        createdAt: json["created_at"],
        pinned: json["pinned"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "createdAt": createdAt.toString(),
        "pinned": pinned,
      };
}
