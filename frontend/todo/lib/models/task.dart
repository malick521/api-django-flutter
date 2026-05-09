class TaskModel {
  int? id;
  String task;
  bool done;
  String created_at;

  TaskModel({
    this.id,
    required this.task,
    required this.done,
    required this.created_at,
  });

  // convert JSON to Task Model

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      task: json['task'],
      done: json['done'],
      created_at: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'task': task, 'done': done, 'created_at': created_at};
  }
}
