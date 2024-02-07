import 'package:formacao_flutter/data/task_DAO.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// vai ser tipo future pq preciso que ele espere que o banco seja carregado
Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path, onCreate: (bd, version) {
    bd.execute(TaskDao.tableSql);
  }, version: 1,);
}

