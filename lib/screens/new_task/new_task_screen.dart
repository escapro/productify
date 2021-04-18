import 'package:flutter/material.dart';
import 'package:productify/components/form/button_select.dart';
import 'package:productify/components/form/form_title.dart';
import 'package:productify/components/header.dart';
import 'package:productify/components/section_title.dart';

class NewTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        oldContext: context,
        backBtn: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: 'Добавление задачи',
          ),
          FormTitle(
            title: 'sad'
          ),
          ButtonSelect(
            items: ['ЗАДАЧА', 'АКТИВНОСТЬ'],
          )
        ],
      )
    );
  }
}