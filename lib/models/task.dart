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
  List<String> weeks;

  List<int> selectedWeeks;
  int type;

  TaskRepeatability.regular(BuildContext context, this.selectedWeeks){
    type = 1;
    weeks = [
      S.of(context).week1,
      S.of(context).week2,
      S.of(context).week3,
      S.of(context).week4,
      S.of(context).week5,
      S.of(context).week6,
      S.of(context).week7,
    ];
  }

  TaskRepeatability.once(BuildContext context){
    type = 2;
  }
}

class Task {

  TaskType type;
  String name;
  TaskRepeatability repeatability;
  Workflow flow;
  int priority;
  int reminder;
  int icon;

  Task(
    this.type,
    this.name,
    this.repeatability,
    this.flow,
    // this.priority,
    // this.reminder,
    // this.icon,
  );

}