// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_first/components/todo_dialog.dart';
import 'package:flutter_first/components/todo_tile.dart';
import 'package:flutter_first/models/todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Todo> todoList = [];
  final textFieldController = TextEditingController();

  void handleShowDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return TodoDialog(
          textFieldController: textFieldController,
          onCreate: onCreateTask,
          onCancel: onCancelCreateTask,
        );
      },
    );
  }

  void createNewTask() {
    setState(() {
      todoList.add(
          Todo(taskName: textFieldController.text, isTaskCompleted: false));
    });
  }

  void onCreateTask() {
    createNewTask();
    textFieldController.clear();
    Navigator.of(context).pop();
  }

  void onCancelCreateTask() {
    Navigator.of(context).pop();
  }

  void handleTaskDelete(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

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
          return TodoTile(
            taskName: todoList[index].taskName,
            isTaskCompleted: todoList[index].isTaskCompleted,
            handleTaskDelete: () => handleTaskDelete(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleShowDialog,
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
