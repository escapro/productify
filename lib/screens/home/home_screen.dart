import 'package:flutter/material.dart';
import 'package:productify/components/section_title.dart';
import 'package:productify/generated/l10n.dart';
import 'package:productify/screens/home/components/header.dart';
import 'package:productify/screens/home/components/today_tasks.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenHeader(),
      body: Container(
          child: ListView(
            children: [
              SectionTitle(title: S.of(context).today_tasks),
              TodayTasks(),
            ],
          )
        ),
    );
  }
}