import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/controllers/task_controller.dart';

class TaskAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int id;
  final bool pinned;
  const TaskAppBar({super.key, required this.id, required this.pinned});

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  State<TaskAppBar> createState() => _TaskAppBarState();
}

class _TaskAppBarState extends State<TaskAppBar> {
  late bool pinned;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TaskController>();

    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 24.0, left: 24.0, top: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pinned = !pinned;
                    controller.togglePinned(widget.id, pinned);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff000000),
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: (pinned) ? Colors.black : Colors.white,
                  ),
                  child: Row(
                    children: [
                      (pinned)
                          ? Icon(
                              Icons.push_pin_outlined,
                              size: 14,
                              color: Colors.white,
                            )
                          : Icon(Icons.push_pin_outlined, size: 14),
                      SizedBox(width: 5),
                      Text(
                        (pinned) ? "Pinned" : "Pin",
                        style: TextStyle(
                          fontFamily: "Graphik",
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: (pinned) ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pinned = widget.pinned;
  }
}
