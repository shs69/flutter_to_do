import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/app_bar_task.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});
  @override
  State<NewTaskScreen> createState() => _NewTaskScreen();
}

class _NewTaskScreen extends State<NewTaskScreen> {
  List<bool> selections = [true, false, false, false];
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
      body: ListView(
        children: const [],
      ),
    );
  }
}
