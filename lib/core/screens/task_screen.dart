import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/widgets/app_bar_task.dart';
import 'package:to_do_app/core/widgets/editable_task_title.dart';
import 'package:to_do_app/core/widgets/task_view.dart';
import 'package:to_do_app/data/controllers/task_controller.dart';

class TaskScreen extends StatefulWidget {
  final int id;
  final String title;
  final String category;
  final bool pinned;

  const TaskScreen({
    super.key,
    required this.id,
    required this.title,
    required this.category,
    required this.pinned,
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
    final controller = context.watch<TaskController>();
    final affairs =
        controller.tasks.firstWhere((task) => task.id == widget.id).taskList;

    void onReorder(int oldIndex, int newIndex) {
      setState(() {
        if (affairs[oldIndex][0] == "To-do") {
          final item = affairs.removeAt(oldIndex);
          affairs.insert(affairs.length, item);
          return;
        }
        if (newIndex > oldIndex) newIndex -= 1;
        final item = affairs.removeAt(oldIndex);
        affairs.insert(newIndex, item);
      });
    }

    return Scaffold(
      appBar: TaskAppBar(id: widget.id, pinned: widget.pinned),
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
                          controller.changeCategory(widget.id, category);
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
          left: 24.0,
          right: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 26.0, bottom: 12.0, left: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: EditableTaskTitle(
                      onChanged: (newTitle) {
                        controller.changeTitle(widget.id, newTitle);
                      },
                      initialTitle: widget.title,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReorderableListView(
                onReorder: onReorder,
                proxyDecorator: (child, index, animation) {
                  return Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    elevation: 2,
                    child: child,
                  );
                },
                children: [
                  for (int i = 0; i < affairs.length; i++)
                    ReorderableDragStartListener(
                      index: i,
                      key: ValueKey(affairs[i]),
                      child: TaskView(
                        isDone: affairs[i][1],
                        taskId: widget.id,
                        initialValue: affairs[i][0],
                        affairIndex: i,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
