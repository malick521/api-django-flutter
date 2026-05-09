import 'package:dio/dio.dart';
import 'package:todo/models/task.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.100.5:8000',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<List<TaskModel>> getTask() async {
    try {
      final response = await _dio.get('/todo/tasks');

      return (response.data as List)
          .map((task) => TaskModel.fromJson(task))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> addTask(TaskModel task) async {
    try {
      await _dio.post('/todo/tasks', data: task.toJson());
    } catch (e) {
      print(">>>> : $e");
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
      await _dio.put('/todo/tasks/${task.id}/', data: task.toJson());
    } catch (e) {
      print(">>>> : $e");
    }
  }

  Future<void> deleteTask(TaskModel task) async {
    try {
      await _dio.delete('/todo/tasks/${task.id}/');
    } catch (e) {
      print(">>>> : $e");
    }
  }
}
