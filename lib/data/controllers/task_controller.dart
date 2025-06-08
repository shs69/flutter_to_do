import "package:to_do_app/data/models/task_model.dart";
import "package:to_do_app/data/db/task_storage.dart";
import "package:flutter/material.dart";

class TaskController extends ChangeNotifier{
  List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  Future<void> loadTasks() async {
    final loadedTasks = await TaskStorage.loadTasks();
      _tasks = loadedTasks;
      notifyListeners();
  }

  Future<void> saveTasks() async {
    await TaskStorage.saveTasks(_tasks);
    notifyListeners();
  }

  void addTask(
      {String title = '', String category = 'work', bool pinned = false}) {
    Task newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch,
        title: title,
        category: category,
        createdAt: DateTime.now(),
        pinned: pinned);
      _tasks.add(newTask);
    saveTasks();
    notifyListeners();
  }

  void deleteTask(int taskId){
    _tasks.removeWhere((task) => task.id == taskId);
    saveTasks();
    notifyListeners();
  }
}
