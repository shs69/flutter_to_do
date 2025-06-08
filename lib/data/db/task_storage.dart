import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:to_do_app/data/models/task_model.dart';

class TaskStorage {
  static const _key = 'tasks';

  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = tasks.map((t) => t.toJson()).toList();
    prefs.setString(_key, jsonEncode(jsonList));
  }

  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];

    final List decoded = jsonDecode(jsonString);
    return decoded.map((json) => Task.fromJson(json)).toList();
  }
}
