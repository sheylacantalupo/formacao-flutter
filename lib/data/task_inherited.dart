import 'package:flutter/material.dart';
import 'package:formacao_flutter/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/dash.png', 5),
    Task('Andar de bike', 'assets/images/bike.webp', 2),
    Task('Meditar', 'assets/images/meditar.jpeg', 4),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));

  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
    context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }
  // oldWidget é o estado anterior da Widget
  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
