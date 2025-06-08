import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/app_bar_task.dart';

class TaskScreen extends StatefulWidget {
  final String title;
  final String category;

  TaskScreen({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  State<TaskScreen> createState() => _NewTaskScreen();
}

class _NewTaskScreen extends State<TaskScreen> {
  late String category;
  List<bool> selections = [false, false, false, false];
  List<String> cat2sel = ['personal', 'work', 'finance', 'other'];
  List<Widget> categories = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text('Personal'),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text('Work'),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text('Finance'),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text('Other'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    category = widget.category;
    int index = cat2sel.indexOf(widget.category);
    selections[index] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(),
      backgroundColor: Color(0xffFFFFFF),
      bottomNavigationBar: BottomAppBar(
        height: 150.0,
        color: Color(0xffFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Divider(),
            Text(
              "Choose a label",
              style: TextStyle(
                fontFamily: "Graphik",
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  borderRadius: BorderRadius.circular(12),
                  selectedBorderColor: Colors.black,
                  isSelected: selections,
                  renderBorder: false,
                  fillColor: Colors.black,
                  selectedColor: Colors.white,
                  color: Colors.grey,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < selections.length; i++) {
                        selections[i] = i == index;
                        if (selections[i]) {
                          category = cat2sel[i];
                        }
                      }
                    });
                  },
                  children: categories,
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          left: 20.0,
          right: 20.0,
          bottom: 30.0,
        ),
        child: ListView(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: "Graphik",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
