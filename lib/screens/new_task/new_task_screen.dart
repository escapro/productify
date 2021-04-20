import 'package:flutter/material.dart';
import 'package:productify/components/alert.dart';
import 'package:productify/components/date_picker.dart';
import 'package:productify/components/form/button_select.dart';
import 'package:productify/components/form/form_group.dart';
import 'package:productify/components/form/form_title.dart';
import 'package:productify/components/form/input.dart';
import 'package:productify/components/form/week_selection.dart';
import 'package:productify/components/header.dart';
import 'package:productify/components/section_title.dart';

class NewTaskScreen extends StatefulWidget {

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  int _type = 1;
  TextEditingController _taskTitle = TextEditingController();
  int _repeatability = 1;
  List<int> _repeatability_weeks;
  int _priority = 1;
  TimeOfDay _reminder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        oldContext: context,
        backBtn: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionTitle(
              title: 'Добавление задачи',
            ),
            FormGroup(
              children: [
                FormTitle(
                  title: 'Вид задачи'
                ),
                ButtonSelect(
                  onChange: (value) => setState(() => {_type=value}),
                  items: ['ЗАДАЧА', 'АКТИВНОСТЬ'],
                ),
                Alert(type: 'info', text: 'К каждому потоку можно добавлять только одну активность!')
              ],
            ),
            FormGroup(
              children: [
                FormTitle(
                  title: 'Название задачи',
                ),
                Input(
                  placeholder: 'Задача',
                  controller: _taskTitle,
                )
              ],
            ),
            FormGroup(
              children: [
                FormTitle(
                  title: 'Повторяемость',
                ),
                ButtonSelect(
                  items: ['РЕГУЛЯРНАЯ', 'РАЗОВАЯ'],
                  onChange: (value) => setState(() => {_repeatability=value}),
                ),
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

              ],
            ),
            FormGroup(
              children: [
                FormTitle(
                  title: 'Приоритет',
                ),
                ButtonSelect(
                  items: ['ВЫСОКИЙ', 'СРЕДНИЙ', 'НИЗКИЙ'],
                  onChange: (values) => setState(() => {_priority=values}),
                )
              ],
            ),FormGroup(
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
            )
          ],
        ),
      )
    );
  }
}