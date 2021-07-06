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