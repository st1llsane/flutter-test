// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_first/components/todo_dialog.dart';
import 'package:flutter_first/components/todo_tile.dart';
import 'package:flutter_first/db/todo_db.dart';
import 'package:flutter_first/models/todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static TodoDB todoDB = TodoDB();
  Future<List<Todo>>? todos;
  final textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    fetchTodos();
  }

  void fetchTodos() {
    setState(() {
      todos = todoDB.fetchAll();
    });
  }

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

  void onCreateTask() async {
    await todoDB.create(taskName: textFieldController.text);
    fetchTodos();
    textFieldController.clear();

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  void onUpdateTask(int id, int isDone) async {
    await todoDB.update(id, isDone);
    fetchTodos();
  }

  void onDeleteTask(int id) async {
    await todoDB.delete(id);
    fetchTodos();
  }

  void onCancelCreateTask() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Text("TODO"),
      ),
      body: FutureBuilder<List<Todo>>(
          future: todos,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else {
              List<Todo> todoList = snapshot.data ?? [];

              return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return TodoTile(
                    id: todoList[index].id,
                    taskName: todoList[index].taskName,
                    isDone: todoList[index].isDone,
                    onUpdateTask: () => onUpdateTask(todoList[index].id,
                        todoList[index].isDone == 0 ? 1 : 0),
                    onDeleteTask: () => onDeleteTask(todoList[index].id),
                  );
                },
              );
            }
          }),
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
