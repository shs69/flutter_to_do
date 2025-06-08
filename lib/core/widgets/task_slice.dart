import 'package:flutter/material.dart';
import 'package:to_do_app/core/screens/task_screen.dart';
import "package:get/get.dart";

class TaskSlice extends StatefulWidget {
  const TaskSlice({
    super.key,
    required this.name,
    required this.date,
    required this.pinned,
    required this.category,
  });

  final String name;
  final DateTime date;
  final bool pinned;
  final String category;

  @override
  State<TaskSlice> createState() => _TaskSliceState();
}

class _TaskSliceState extends State<TaskSlice> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: GestureDetector(
        onTap: () {
          Get.to(
              () => TaskScreen(title: widget.name, category: widget.category));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.125,
          decoration: BoxDecoration(
            color: Color(0xffFFF6E7),
            borderRadius: BorderRadius.circular(16),
            border: widget.pinned
                ? Border.all(
                    color: Color(0xff000000),
                  )
                : Border(),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontFamily: "Graphik",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        widget.category.capitalizeFirst ?? "Work",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Graphik",
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.045),
                    Icon(
                      Icons.calendar_today,
                      size: 20,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.013),
                    Text(
                      widget.date.toString(),
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontFamily: "Graphik",
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
