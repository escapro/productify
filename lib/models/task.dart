import 'package:flutter/material.dart';
import 'package:productify/generated/l10n.dart';
import 'package:productify/models/workflow.dart';

class TaskType { 
  static const List<String> list = ['ЗАДАЧА', 'АКТИВНОСТЬ'];
  String title;
  int id;

  TaskType.task(){
    title = TaskType.list[0];
    id = 1;
  }

  TaskType.activity(){
    title = TaskType.list[1];
    id = 2;
  }
}
class TaskRepeatability {
  static const List<String> list = ['РЕГУЛЯРНАЯ', 'РАЗОВАЯ'];
  List<int> weeks;
  String title;
  int id;

  TaskRepeatability.regular(BuildContext context, this.weeks){
    title = TaskRepeatability.list[0];
    id = 1;
  }

  TaskRepeatability.once(BuildContext context){
    title = TaskRepeatability.list[1];
    id = 2;
  }
}
class TaskPriority { 
  static const List<String> list = ['ВЫСОКИЙ', 'СРЕДНИЙ', 'НИЗКИЙ'];
  String title;
  int id;

  TaskPriority.hight(){
    title = TaskPriority.list[0];
    id = 1;
  }

  TaskPriority.medium(){
    title = TaskPriority.list[1];
    id = 2;
  }

  TaskPriority.low(){
    title = TaskPriority.list[1];
    id = 3;
  }
}
class TaskReminder {
  final int hour;
  final int minute;

  TaskReminder(this.hour, this.minute);
}

class Task {

  final TaskType type;
  final String name;
  final TaskRepeatability repeatability;
  final Workflow flow;
  final TaskPriority priority;
  final TaskReminder reminder;
  final IconData icon;

  Task({
    @required this.type,
    @required this.name,
    @required this.repeatability,
    @required this.flow,
    @required this.priority,
    this.reminder,
    this.icon,
  });

  bool create() {
    return true;
  }

   bool qwe() {
    return true;
  }

}