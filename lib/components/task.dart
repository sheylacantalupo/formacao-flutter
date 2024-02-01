import 'package:flutter/material.dart';
import 'package:formacao_flutter/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {super.key});

  int nivel = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return true;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            //color: Colors.blue,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork()
                            ? Image.asset(
                                widget.foto,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        Difficulty(widget: widget),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      //width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                            //print(nivel);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.white,
                              ),
                              Text(
                                'UP',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.blue.shade200,
                        value: (widget.dificuldade) > 0
                            ? (widget.nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Nivel: ${widget.nivel}',
                        style: const TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
