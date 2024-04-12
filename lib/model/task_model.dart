class TaskModel {
  final String title;
  final DateTime data;

  TaskModel({required this.title, required this.data});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'data': data.toString(),
    };
  }
}
