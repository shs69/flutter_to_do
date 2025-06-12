import "package:to_do_app/data/models/task_model.dart";
import "package:to_do_app/data/db/task_storage.dart";
import "package:flutter/material.dart";

class TaskController extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    final loadedTasks = await TaskStorage.loadTasks();
    _tasks = loadedTasks;
    notifyListeners();
  }

  Future<void> saveTasks() async {
    await TaskStorage.saveTasks(_tasks);
    notifyListeners();
  }

  int addTask(
      {String title = '', String category = 'work', bool pinned = false}) {
    Task newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch,
        title: title,
        category: category,
        pinned: pinned);
    _tasks.add(newTask);
    saveTasks();
    notifyListeners();
    return newTask.id;
  }

  void deleteTask(int taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
    saveTasks();
    notifyListeners();
  }

  void changeTitle(int taskId, String newTitle) {
    for (var task in _tasks) {
      if (task.id == taskId) {
        task.title = newTitle;
      }
    }
    saveTasks();
    notifyListeners();
  }

  void changeCategory(int taskId, String newCategory) {
    for (var task in _tasks) {
      if (task.id == taskId) {
        task.category = newCategory.toLowerCase().replaceAll(" ", "");
      }
    }
    saveTasks();
    notifyListeners();
  }

  void togglePinned(int taskId, bool pinned){
    for (var task in _tasks) {
      if (task.id == taskId){
        task.pinned = pinned;
      }
    }
    saveTasks();
    notifyListeners();
  }
}
