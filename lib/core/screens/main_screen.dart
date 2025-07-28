import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:to_do_app/core/screens/task_screen.dart";
import "package:to_do_app/core/widgets/app_bar.dart";
import "package:to_do_app/core/widgets/task_slice.dart";
import "package:to_do_app/data/controllers/task_controller.dart";
import "package:to_do_app/data/models/task_model.dart";
import "package:get/get.dart";
import 'package:flutter_svg/flutter_svg.dart';

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
    context.read<TaskController>().loadTasks();
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
          Get.to(() => TaskScreen(
              id: id, title: "Task Name", category: "work", pinned: false));
        },
        backgroundColor: Color(0xff000000),
        foregroundColor: Color(0xffFFFFFF),
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: tasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 90,
                children: [
                  SvgPicture.asset(
                    "lib/data/assets/logo/woman.svg",
                  ),
                  Text(
                    "Create your first to-do list...",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                      fontFamily: "Graphik",
                    ),
                  ),
                ],
              ),
            )
          : ListView(
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
