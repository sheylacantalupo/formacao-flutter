import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formacao_flutter/data/task_inherited.dart';
import 'package:formacao_flutter/screens/form_screen.dart';

// informações que estamos recebendo
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

// estados que estamos alterando
class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
          children: TaskInherited.of(context).taskList,
          padding: EdgeInsets.only(top: 8, bottom: 70),
        ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
