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