import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:to_do_app/core/screens/task_screen.dart";
import "package:to_do_app/core/widgets/app_bar.dart";
import "package:to_do_app/core/widgets/task_slice.dart";
import "package:to_do_app/data/controllers/task_controller.dart";
import "package:to_do_app/data/models/task_model.dart";
import "package:get/get.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        final controller = Provider.of<TaskController>(context, listen: false);
        controller.loadTasks();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskController>().tasks;

    return Scaffold(
      appBar: DefaultAppBar(title: "Dooit"),
      backgroundColor: Color(0xffFFFFFF),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          int id = context.read<TaskController>().addTask(title: "Task Name");
          Get.to(
              () => TaskScreen(id: id, title: "Task Name", category: "work"));
        },
        backgroundColor: Color(0xff000000),
        foregroundColor: Color(0xffFFFFFF),
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: tasks.map((task) {
          return TaskSlice(
            id: task.id,
            name: task.title,
            date: task.createdAt,
            pinned: task.pinned,
            category: task.category,
          );
        }).toList(),
      ),
    );
  }
}
