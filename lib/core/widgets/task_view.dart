import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:to_do_app/core/widgets/editable_task_title.dart";
import "package:to_do_app/data/controllers/task_controller.dart";

class TaskView extends StatefulWidget {
  final bool isDone;
  final int taskId;
  final String initialValue;
  final int affairIndex;

  const TaskView({
    super.key,
    required this.isDone,
    required this.taskId,
    required this.initialValue,
    required this.affairIndex,
  });

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late bool isDone;

  @override
  void initState() {
    super.initState();
    isDone = widget.isDone;
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TaskController>();

    return Row(
      children: [
        Icon(Icons.drag_indicator),
        IconButton(
          icon: Icon(
            (isDone) ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.black,
          ),
          onPressed: () => setState(() {
            if (widget.initialValue != "To-do") {
              isDone = !isDone;
              controller.toggleAffairDone(
                  widget.taskId, widget.affairIndex, isDone);
            }
          }),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: EditableTaskTitle(
              key: ValueKey(isDone),
              onChanged: (value) {
                controller.addOrChangeAffair(
                    widget.taskId, value, widget.affairIndex);
                if (!controller.checkEmptyAffair(widget.taskId)) {
                  controller.addOrChangeAffair(widget.taskId, 'To-do', 9999);
                }
              },
              initialTitle: widget.initialValue,
              fontStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                fontFamily: "Graphik",
                color: Color(0xff8c8e8f),
                decoration: (isDone) ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
