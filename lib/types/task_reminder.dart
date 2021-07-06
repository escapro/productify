class TaskReminder {
  final int hour;
  final int minute;

  TaskReminder(this.hour, this.minute);

  String getString() {
    return "$hour:$minute";
  }
}