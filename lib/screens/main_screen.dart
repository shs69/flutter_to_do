import "package:flutter/material.dart";
import "package:to_do_app/screens/new_task_screen.dart";
import "package:to_do_app/widgets/app_bar.dart";
import "package:to_do_app/widgets/task_slice.dart";
import "package:get/get.dart";

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "Dooit"),
      backgroundColor: Color(0xffFFFFFF),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => NewTaskScreen()),
        backgroundColor: Color(0xff000000),
        foregroundColor: Color(0xffFFFFFF),
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          TaskSlice(
            name: "Task Name",
            date: "13-05-2022",
            pinned: true,
          ),
          TaskSlice(
            name: "Task Name",
            date: "13-05-2022",
            pinned: false,
          ),
          TaskSlice(
            name: "Task Name",
            date: "13-05-2022",
            pinned: false,
          ),
          TaskSlice(
            name: "Task Name",
            date: "13-05-2022",
            pinned: false,
          ),
          TaskSlice(
            name: "Task Name",
            date: "13-05-2022",
            pinned: false,
          ),
          TaskSlice(
            name: "Task Name",
            date: "13-05-2022",
            pinned: false,
          ),
          TaskSlice(
            name: "Task Name",
            date: "13-05-2022",
            pinned: false,
          ),
          TaskSlice(
            name: "Task Name",
            date: "13-05-2022",
            pinned: false,
          ),
        ],
      ),
    );
  }
}
