import 'package:flutter/material.dart';

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