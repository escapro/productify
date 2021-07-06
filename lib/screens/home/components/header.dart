import 'package:flutter/material.dart';
import 'package:productify/components/header.dart';
import 'package:productify/components/rect_icon_button.dart';
import 'package:productify/generated/l10n.dart';
import 'package:productify/screens/tasks/new_task/new_task_screen.dart';

class HomeScreenHeader extends StatelessWidget implements PreferredSizeWidget{
  
  final Function callback;
  
  HomeScreenHeader({
    this.callback,
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Header(
      oldContext: context,
      title: S.of(context).app_bar_title,
      backBtn: false,
      actions: <Widget>[
        RectIconButton(
          oldContext: context,
          icon: Icons.add,
          // onTap: () => Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (oldContext) => NewTaskScreen()
          //   )
          // ),
          onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => NewTaskScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(0.0, 1.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            )
          ).then((value) {
            callback();
          }),
        ),
      ],
    );
  }
}