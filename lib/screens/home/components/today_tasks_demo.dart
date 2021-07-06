import 'package:flutter/material.dart';
import 'package:productify/models/task.dart';
import 'package:productify/screens/home/components/task_list_item.dart';
import 'package:productify/services/db.dart';

class TodayTasksDemo extends StatefulWidget {

  TodayTasksDemo({
    Key key,
  }) : super(key: key);

  @override
  _TodayTasksDemoState createState() => _TodayTasksDemoState();
}

class _TodayTasksDemoState extends State<TodayTasksDemo> {

  List<Task> _tasks = [];
  List<Widget> get _items => _tasks.map((item) => format(item)).toList();

  @override
  void initState() {
    refresh();
    super.initState();
  }
  
  Widget format(Task item) {
    print(item.name.runtimeType);
    return TaskListItem(
      title: item.name != null ? item.name : TaskListItem.activityName,
      category: "ewr",
      flow: "erte",
      activity: 34,
    );
  }

  void refresh() async {
    List<Map<String, dynamic>> _results = await DB.select(Task().tableName);
    setState(() {
      _tasks = _results.map((item) => Task.fromMap(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _items,
    );
  }
}