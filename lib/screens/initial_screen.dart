import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formacao_flutter/components/task.dart';

// informações que estamos recebendo
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

// estados que estamos alterando
class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
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
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          // essa já é a configuração default
          scrollDirection: Axis.vertical,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Task(
                'Aprender Flutter',
                'assets/images/dash.png',
                5),
            Task(
                'Andar de bike',
                'assets/images/bike.webp',
                2),
            Task(
                'Meditar',
                'assets/images/meditar.jpeg',
                4),
            SizedBox(height: 80,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });

        },
        child: const Icon(Icons.remove_red_eye, color: Colors.white,),
      ),
    );
  }
}

