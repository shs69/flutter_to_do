import 'package:flutter/material.dart';

class EditableTaskTitle extends StatefulWidget {
  final String initialTitle;
  final ValueChanged<String> onChanged;
  final TextStyle fontStyle;

  const EditableTaskTitle({
    super.key,
    required this.onChanged,
    required this.initialTitle,
    TextStyle? fontStyle,
  }) : fontStyle = fontStyle ??
            const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
              fontFamily: "Graphik",
            );

  @override
  State<EditableTaskTitle> createState() => _EditableTaskTitleState();
}

class _EditableTaskTitleState extends State<EditableTaskTitle> {
  bool _isEditing = false;
  late TextStyle fontStyle;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialTitle);
    fontStyle = widget.fontStyle;
  }

  void _save() {
    widget.onChanged(_controller.text.trim());
    setState(() {
      _isEditing = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isEditing) {
      return TextField(
        style: fontStyle,
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          isCollapsed: true,
        ),
        cursorColor: Colors.black,
        cursorWidth: 1.4,
        onSubmitted: (value) => _save(),
        onTapOutside: (value) => _save(),
      );
    } else {
      return GestureDetector(
        onTap: () {
          setState(() {
            _isEditing = true;
          });
        },
        child: Text(
          _controller.text,
          style: fontStyle,
        ),
      );
    }
  }
}
