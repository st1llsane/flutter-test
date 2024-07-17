// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String taskName;
  final bool? isTaskCompleted;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.isTaskCompleted,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool _isTaskCompleted = false;

  @override
  void initState() {
    super.initState();
    _isTaskCompleted = widget.isTaskCompleted ?? false;
  }

  void handleTaskComplete(bool? isCompleted) {
    setState(() {
      _isTaskCompleted = isCompleted ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: GestureDetector(
        onTap: () => handleTaskComplete(!_isTaskCompleted),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade400,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 5, right: 20, bottom: 5, left: 0),
            child: Row(
              children: [
                Checkbox(
                  value: _isTaskCompleted,
                  onChanged: (bool? isCompleted) =>
                      handleTaskComplete(isCompleted),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: Colors.teal.shade300,
                  checkColor: Colors.grey.shade800,
                ),
                Text(widget.taskName)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
