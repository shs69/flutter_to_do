import 'package:flutter/material.dart';

class EditableTaskTitle extends StatefulWidget {
  final String initialTitle;
  final ValueChanged<String> onChanged;

  const EditableTaskTitle({super.key, required this.onChanged, required this.initialTitle});

  @override
  State<EditableTaskTitle> createState() => _EditableTaskTitleState();
}

class _EditableTaskTitleState extends State<EditableTaskTitle> {
  bool _isEditing = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialTitle);
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
        controller: _controller,
        autofocus: true,
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
          style: TextStyle(
            fontFamily: "Graphik",
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
  }
}

