import 'package:formacao_flutter/components/task.dart';
import 'package:formacao_flutter/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTERGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _difficulty = 'difficulty';
  static const String _name = 'name';
  static const String _image = 'image';

  save(Task tarefa) async {
    print('iniciando o save');
    final Database bancoDeDados = await getDatabase();
    var itemExiste = await find(tarefa.nome);
    Map<String,dynamic> taskMap = toMap(tarefa);
    if (itemExiste.isEmpty) {
      print('a tarefa não existia');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('A tarefa já existia na lista');
      return await bancoDeDados.update(
        _tablename, taskMap, where: '$_name = ?', whereArgs: [tarefa.nome],);
    }
  }

  Map<String,dynamic> toMap(Task tarefa){
    print('Convertendo tarefa em map');
    final Map<String,dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    print('Nosso mapa de atrefas é $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
        _tablename);
    print('Procurando dados no banco...encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List:');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de tarefas $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa],);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('Deletando tarefa: $nomeDaTarefa');
    final Database bandoDeDados = await getDatabase();
    return bandoDeDados.delete(_tablename,where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }
}
