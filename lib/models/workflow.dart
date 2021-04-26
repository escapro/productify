const List<Map> db = [
  {"id": 1, "title": "Работа"},
  {"id": 2, "title": "Youtube"},
  {"id": 3, "title": "Сайт"},
];

class Workflow {
  String title;
  int id;

  static List<Map> fetchAll() {
    return db;
  }

  static fetch(int id) {
    Workflow instance;
    db.forEach((e) {
      if(e['id'] == id){
        instance = new Workflow();
        instance.id = e['id'];
        instance.title = e['title'];
      }
    });
    return instance;
  }
}