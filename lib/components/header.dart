import 'package:flutter/material.dart';
import 'package:productify/components/back_button.dart';
import 'package:productify/constans.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {

  final BuildContext oldContext;
  final String title;
  final bool backBtn;
  final List<Widget> actions;
  
  Header({Key key, this.title = '', this.backBtn = false, this.oldContext, this.actions}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title, style: TextStyle(
          color: kTextColorBlack,
          fontSize: 15.0,
          fontWeight: FontWeight.bold
        )),
        leading: backBtn ? BackBtn(context: context) : null,
        actions: actions

      );
  }

}