import "package:to_do_app/data/models/task_model.dart";
import "package:to_do_app/data/db/task_storage.dart";
import "package:flutter/material.dart";

class TaskController extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    // TaskStorage.printAllPrefs();
    final loadedTasks = await TaskStorage.loadTasks();
    _tasks = loadedTasks;
    sortTasks();
    notifyListeners();
  }

  Future<void> saveTasks() async {
    sortTasks();
    await TaskStorage.saveTasks(_tasks);
    notifyListeners();
  }

  void sortTasks() {
    _tasks.sort((a, b) {
      if (a.pinned != b.pinned) {
        return a.pinned ? -1 : 1;
      }
      return DateTime.parse(b.createdAt).compareTo(DateTime.parse(a.createdAt));
    });
  }

  int addTask(
      {String title = '', String category = 'work', bool pinned = false}) {
    Task newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      category: category,
      pinned: pinned,
      taskList: [
        ["To-do", false]
      ],
    );
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

  void togglePinned(int taskId, bool pinned) {
    for (var task in _tasks) {
      if (task.id == taskId) {
        task.pinned = pinned;
      }
    }
    saveTasks();
    notifyListeners();
  }

  List getAffair(int taskId) {
    Task task = tasks.firstWhere((task) => task.id == taskId);
    return task.taskList;
  }

  void addOrChangeAffair(int taskId, String affairText, int affairIndex) {
    final affairs = getAffair(taskId);
    final rightAffair = affairs.elementAtOrNull(affairIndex);

    if (rightAffair == null) {
      affairs.add([affairText, false]);
    } else {
      affairs[affairIndex] = [affairText, false];
    }
    saveTasks();
    notifyListeners();
  }

  bool checkEmptyAffair(int taskId) {
    Task task = _tasks.firstWhere((task) => task.id == taskId);
    for (final affair in task.taskList) {
      if (affair[0] == "To-do") return true;
    }
    return false;
  }

  void toggleAffairDone(int taskId, int affairIndex, bool isDone) {
    final affairsList = getAffair(taskId);
    final rightAffair = affairsList.elementAtOrNull(affairIndex);

    if (rightAffair != null) {
      affairsList[affairIndex][1] = isDone;
    }
    saveTasks();
    notifyListeners();
  }

  void deleteAffair(int taskId, int affairIndex) {
    _tasks
        .firstWhere((task) => task.id == taskId)
        .taskList
        .removeAt(affairIndex);
    saveTasks();
    notifyListeners();
  }

  List<Task> search(String name) {
    return _tasks.where((task) => task.title == name).toList();
  }
}
