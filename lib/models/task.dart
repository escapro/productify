import 'package:productify/models/model.dart';

class Task extends Model {

  final String tableName = 'task';
  final String columnId = 'id';
  final String columnType = 'type';
  final String columnName = 'name';
  final String columnRepeatability = 'repeatability';
  final String columnFlowId = 'flow_id';
  final String columnPriority= 'priority';
  final String columnReminder = 'reminder';
  final String columnIcon = 'icon';

  final int id;
  final int type;
  final String name;
  final int repeatability;
  final int flowId;
  final int priority;
  final String reminder;
  final int icon;

  Task({
    this.id,
    this.type,
    this.name,
    this.repeatability,
    this.flowId,
    this.priority,
    this.reminder,
    this.icon,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
        'type': type,
        'name': name,
        'repeatability': repeatability,
        'flow_id': flowId,
        'priority': priority,
        'reminder': reminder,
        'icon': icon,
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  static Task fromMap(Map<String, dynamic> map) {
   return Task(
    id: map['id'],
    type: map['type'],
    name: map['name'],
    repeatability: map['repeatability'],
    flowId: map['flow_id'],
    priority: map['priority'],
    reminder: map['reminder'],
    icon: map['icon'],
   );
  }

  String getTableExecuteQuery() {
    return '''
        create table $tableName ( 
        $columnId integer primary key autoincrement, 
        $columnType integer not null,
        $columnName text,
        $columnRepeatability integer not null,
        $columnFlowId indeger not null,
        $columnPriority integer not null,
        $columnReminder text,
        $columnIcon integer)
        ''';
  }
}