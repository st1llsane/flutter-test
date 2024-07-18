// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_first/components/ui/button.dart';

class TodoDialog extends StatelessWidget {
  final TextEditingController textFieldController;
  final VoidCallback onCreate;
  final VoidCallback onCancel;

  const TodoDialog({
    required this.textFieldController,
    required this.onCreate,
    required this.onCancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Add New Task",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blueGrey.shade800, fontSize: 20),
      ),
      content: SizedBox(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: textFieldController,
              autofocus: true,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.blueGrey.shade900),
              decoration: InputDecoration(
                labelText: "Task Name",
                labelStyle: TextStyle(color: Colors.blueGrey.shade900),
                contentPadding: EdgeInsets.zero,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade800),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Button(text: "Create", onPressed: onCreate),
                  SizedBox(width: 12),
                  Button(text: "Cancel", onPressed: onCancel),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
