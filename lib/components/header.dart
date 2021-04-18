import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {

  String title = '';
  bool backBtn = false;
  final List<Widget> actions;
  
  Header({Key key, this.title, this.backBtn, this.actions}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(

        title: Text(this.title, style: TextStyle(
          color: kTextColorBlack,
          fontWeight: FontWeight.bold,
          fontSize: 18.0
          )),

        leading: this.backBtn ? Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.all(Radius.circular((5))),
          ),
          child: GestureDetector(
            child: Icon(Icons.arrow_back_ios_rounded,
                  size: 20, color: kPrimaryColor),
            onTap: () { print("I was tapped!"); },
          ),
        ) : null,

        actions: this.actions

      );
  }

}