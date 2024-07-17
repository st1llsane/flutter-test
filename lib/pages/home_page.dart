// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_first/components/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final Map<String, bool?> todoList = {
    "Task 1": false,
    "Task 2": false,
    "Task 3": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Text("TODO"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final curTaskName = todoList.keys.elementAt(index);

          return TodoTile(
            taskName: curTaskName,
            isTaskCompleted: todoList[curTaskName],
          );
        },
      ),
    );
  }
}
