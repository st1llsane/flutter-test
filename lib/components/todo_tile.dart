// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final int id;
  final String taskName;
  final int isDone;
  final VoidCallback onUpdateTask;
  final VoidCallback onDeleteTask;

  const TodoTile({
    super.key,
    required this.id,
    required this.taskName,
    required this.isDone,
    required this.onUpdateTask,
    required this.onDeleteTask,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: GestureDetector(
        onTap: widget.onUpdateTask,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade400,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 5, right: 5, bottom: 5, left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: widget.isDone == 0 ? false : true,
                  onChanged: (bool? isCompleted) => widget.onUpdateTask,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: Colors.teal.shade300,
                  checkColor: Colors.grey.shade800,
                ),
                Expanded(
                  child: Text(
                    widget.taskName,
                    style: TextStyle(
                        color: widget.isDone == 1
                            ? Colors.blueGrey.shade200
                            : Colors.white,
                        decoration: widget.isDone == 1
                            ? (TextDecoration.lineThrough)
                            : TextDecoration.none),
                  ),
                ),
                IconButton(
                  onPressed: widget.onDeleteTask,
                  icon: Icon(Icons.delete),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
