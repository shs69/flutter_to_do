import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TaskAppBar({super.key});

  @override
  State<TaskAppBar> createState() => _TaskAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class _TaskAppBarState extends State<TaskAppBar> {
  bool pinned = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pinned = !pinned;
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
}
