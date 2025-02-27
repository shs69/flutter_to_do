import 'package:flutter/material.dart';

class TaskSlice extends StatelessWidget {
  const TaskSlice(
      {super.key,
      required this.name,
      required this.date,
      required this.pinned});

  final String name;
  final String date;
  final bool pinned;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.125,
        decoration: BoxDecoration(
          color: Color(0xffFFF6E7),
          borderRadius: BorderRadius.circular(16),
          border: pinned
              ? Border.all(
                  color: Color(0xff000000),
                )
              : Border(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
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
                      "Work",
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
                    date,
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
    );
  }
}
