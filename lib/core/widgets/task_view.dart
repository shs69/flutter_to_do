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

    return Dismissible(
      key: Key(widget.taskId.toString()),
      direction: DismissDirection.endToStart,
      background: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.white))
          ],
        ),
      ),
      onDismissed: (direction) =>
          controller.deleteAffair(widget.taskId, widget.affairIndex),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          spacing: 4,
          children: [
            Icon(Icons.drag_indicator),
            GestureDetector(
              onTap: () => setState(() {
                if (widget.initialValue != "To-do") {
                  isDone = !isDone;
                  controller.toggleAffairDone(
                      widget.taskId, widget.affairIndex, isDone);
                }
              }),
              child: Icon(
                (isDone) ? Icons.check_box : Icons.check_box_outline_blank,
                color: Colors.black,
              ),
            ),
            Expanded(
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
                  color: (widget.initialValue == "To-do")
                      ? Color(0xff8c8e8f)
                      : Colors.black,
                  decoration: (isDone) ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
