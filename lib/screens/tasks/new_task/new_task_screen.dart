import 'package:flutter/material.dart';
import 'package:productify/components/alert.dart';
import 'package:productify/components/form/date_picker.dart';
import 'package:productify/components/form/button_select.dart';
import 'package:productify/components/form/form_group.dart';
import 'package:productify/components/form/form_title.dart';
import 'package:productify/components/form/input.dart';
import 'package:productify/components/form/modal_select.dart';
import 'package:productify/components/form/week_selection.dart';
import 'package:productify/components/header.dart';
import 'package:productify/components/form/icon_picker.dart';
import 'package:productify/components/rect_icon_button.dart';
import 'package:productify/constans.dart';
import 'package:productify/models/task.dart';
import 'package:productify/models/workflow.dart';

class NewTaskScreen extends StatefulWidget {
  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  final _formKey = GlobalKey<FormState>();
  int _type = 1;
  TextEditingController _taskTitle  = TextEditingController();
  int _repeatability = 1;
  List<int> _repeatability_weeks;
  int _priority = 1;
  TimeOfDay _reminder;
  int _icon;
  int _flow = 1;

  @override
  void dispose() {
    _taskTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        oldContext: context,
        title: "НОВАЯ ЗАДАЧА",
        backBtn: true,
        actions: [
          RectIconButton(
            oldContext: context,
            icon: Icons.check,
            onTap: () => {
              if (_formKey.currentState.validate()) createTask()
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: kDefaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                FormGroup(
                  children: [
                    FormTitle(
                      title: 'Вид задачи'
                    ),
                    ButtonSelect(
                      onChange: (value) => setState(() => {_type=value}),
                      items: TaskType.list,
                    ),
                    Alert(type: 'info', text: 'К каждому потоку можно добавлять только одну активность!')
                  ],
                ),
                if(_type == 1)
                FormGroup(
                  children: [
                    FormTitle(
                      title: 'Название задачи',
                    ),
                    Input(
                      placeholder: 'Задача',
                      controller: _taskTitle,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите название задачи';
                        }
                        return null;
                      }
                    )
                  ],
                ),
                FormGroup(
                  children: [
                    FormTitle(
                      title: 'Повторяемость',
                    ),
                    ButtonSelect(
                      items: TaskRepeatability.list,
                      onChange: (value) => setState(() => {_repeatability=value}),
                    ),
                    SizedBox(height: kDefaultPadding / 2),
                    if(_repeatability == 1)
                    WeekSelection(
                      type: WeekSelectionTypes.multi,
                      onChange: (values) => setState(() => {_repeatability_weeks=values}),
                    )
                  ],
                ),
                FormGroup(
                  children: [
                    FormTitle(
                      title: 'Поток',
                    ),
                    ModalSelect(
                      title: "Выбор потока",
                      value: _flow,
                      items: Workflow.fetchAll().map((e) => e['title'].toString()).toList(),
                      onChange: (value) => setState(() => {_flow=value}),
                    )
                  ],
                ),
                FormGroup(
                  children: [
                    FormTitle(
                      title: 'Приоритет',
                    ),
                    ButtonSelect(
                      items: TaskPriority.list,
                      onChange: (values) => setState(() => {_priority=values}),
                    )
                  ],
                ),
                FormGroup(
                  children: [
                    FormTitle(
                      title: 'Напоминание',
                    ),
                    DatePicker(
                      type: DatePickerType.time,
                      controller: _reminder,
                      onChange: (value) => setState(() => {_reminder=value}),
                    )
                  ],
                ),
                if(_repeatability == 1)
                FormGroup(
                  children: [
                    Center(
                      child: FormTitle(
                        title: 'Иконка',
                      ),
                    ),
                    IconPicker(
                      controller: _icon,
                      onChange: (value) => setState(() => {_icon=value}),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  createTask() {

    TaskType type;
    TaskRepeatability repeatability;
    TaskPriority priority;

    if(_type == 1) {
      type = new TaskType.task();
    }else if(_type == 2) {
      type = new TaskType.activity();
    }

    if(_repeatability == 1) {
      repeatability = new TaskRepeatability.regular(context, _repeatability_weeks);
    }else if(_repeatability == 2) {
      repeatability = new TaskRepeatability.once(context);
    }

    if(_priority == 1) {
      priority = new TaskPriority.hight();
    }else if(_priority == 2) {
      priority = new TaskPriority.medium();
    }else if(_priority == 3) {
      priority = new TaskPriority.low();
    }

    Task newTask = new Task(
      type: type,
      name: _taskTitle.text,
      repeatability: repeatability,
      flow: Workflow.fetch(_flow),
      priority: priority,
      reminder: _reminder != null ? TaskReminder(_reminder.hour, _reminder.minute) : null,
      icon: _icon != null ? IconData(_icon, fontFamily: 'MaterialIcons') : null
    );

    // print(newTask.create());
  }
}