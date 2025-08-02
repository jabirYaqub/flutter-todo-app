// lib/providers/task_provider.dart

import 'package:flutter/foundation.dart';
import 'package:miniproject_todo_app/models/task.dart';
import 'package:miniproject_todo_app/services/database_service.dart';

import '../models/task.dart';
import '../services/database_service.dart';

class TaskProvider with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  List<Task> _tasks = [];
  String _searchQuery = '';

  List<Task> get tasks => _tasks;

  List<Task> get incompleteTasks {
    final filteredTasks = _tasks.where((task) => !task.isCompleted);
    return filteredTasks.where((task) => task.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  List<Task> get completedTasks {
    final filteredTasks = _tasks.where((task) => task.isCompleted);
    return filteredTasks.where((task) => task.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  String get searchQuery => _searchQuery;

  TaskProvider() {
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    _tasks = await _databaseService.getTasks();
    notifyListeners();
  }

  Future<void> addTask(String title, String description) async {
    final newTask = Task(
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );
    await _databaseService.insertTask(newTask);
    fetchTasks();
  }

  Future<void> updateTask(Task task) async {
    await _databaseService.updateTask(task);
    fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await _databaseService.deleteTask(id);
    fetchTasks();
  }

  void toggleTaskStatus(Task task) {
    final updatedTask = Task(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: !task.isCompleted,
      createdAt: task.createdAt,
    );
    updateTask(updatedTask);
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}