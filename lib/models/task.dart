class Task {
  int? id;
  String content = "";
  bool completed;
  DateTime? createdAt;

  Task(this.id, this.content, this.completed, this.createdAt);

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['title'],
        completed = json['completed'];

  Map<String, dynamic> toJson() => {
        'title': content,
        'completed': completed,
      };
}
