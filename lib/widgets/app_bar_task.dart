import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskAppBar({super.key});

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
              Container(
                margin: EdgeInsets.only(right: 20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff000000),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.push_pin_outlined, size: 14),
                    SizedBox(width: 5),
                    Text(
                      "Pin",
                      style: TextStyle(
                        fontFamily: "Graphik",
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
