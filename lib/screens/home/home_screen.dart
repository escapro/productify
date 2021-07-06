import 'package:flutter/material.dart';
import 'package:productify/components/bottom_nav.dart';
import 'package:productify/components/section_title.dart';
import 'package:productify/generated/l10n.dart';
import 'package:productify/screens/home/components/header.dart';
import 'package:productify/screens/home/components/today_tasks.dart';
import 'package:productify/screens/home/components/today_tasks_demo.dart';

class HomeScreen extends StatelessWidget {

  Function afterPop;

  @override
  Widget build(BuildContext context) {

    afterPop = () => print("asd");

    return Scaffold(
      appBar: HomeScreenHeader(
        callback: afterPop,
      ),
      body: ListView(
              children: [
                SectionTitle(title: S.of(context).today_tasks),
                TodayTasksDemo(
                  
                ),
                SectionTitle(title: S.of(context).today_tasks),
                TodayTasks(),
              ],
            ),
      bottomNavigationBar: BottomNav()
    );
  }
}