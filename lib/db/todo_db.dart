import 'package:flutter_first/db/db_service.dart';
import 'package:flutter_first/models/todo.dart';
import 'package:sqflite/sqflite.dart';

class TodoDB {
  final tableName = 'todos';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName(
      "id" INTEGER NOT NULL,
      "taskName" TEXT NOT NULL,
      "isDone" INTEGER NOT NULL,
      PRIMARY KEY("id" AUTOINCREMENT)
    );""");
  }

  Future<int> create({required String taskName}) async {
    final database = await DbService().database;

    return await database.rawInsert(
      """INSERT INTO $tableName (taskName, isDone) VALUES (?,?)""",
      [taskName, 0],
    );
  }

  Future<List<Todo>> fetchAll() async {
    final database = await DbService().database;

    final todos = await database.rawQuery(
      """SELECT * FROM $tableName ORDER BY COALESCE(id, 0)""",
    );

    return todos.map((todo) => Todo.fromSqfliteDatabase(todo)).toList();
  }

  Future<Todo> fetchById(int id) async {
    final database = await DbService().database;

    final todo = await database.rawQuery(
      """SELECT * FROM $tableName WHERE id = ?""",
      [id],
    );

    return Todo.fromSqfliteDatabase(todo.first);
  }

  Future<void> update(int id, int isDone) async {
    final database = await DbService().database;

    await database.update(
      tableName,
      {
        'isDone': isDone,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> delete(int id) async {
    final database = await DbService().database;

    await database.rawDelete(
      """DELETE FROM $tableName WHERE id = ?""",
      [id],
    );
  }
}
