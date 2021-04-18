import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class BottomNav extends StatefulWidget {  
  BottomNav({Key key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int _currentIndex = 2;

  void onTabTapped(int index) {
    setState(() {
     _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      elevation: 1,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kPrimaryGreyColor,
      unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 11.0,
          fontWeight: FontWeight.bold,
        ),
      selectedLabelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.shifting,
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.golf_course_sharp),
          backgroundColor: Colors.white,
          label: 'ЦЕЛИ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics_outlined),
          backgroundColor: Colors.white,
          label: 'АНАЛИТИКА',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          backgroundColor: Colors.white,
          label: 'ГЛАВАНЯ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded),
          backgroundColor: Colors.white,
          label: 'СОВЕТЫ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          backgroundColor: Colors.white,
          label: 'НАСТРОЙКИ',
        )
      ],
    );
  }
}