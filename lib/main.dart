import 'package:flutter/material.dart';
import 'package:formacao_flutter/screens/initial_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // o stack permite empilhar os containers
      // Scaffold é a estrutura completa do app
      home: const InitialScreen() ,
    );
  }
}
