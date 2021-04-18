import 'package:flutter/material.dart';
import 'package:productify/components/header.dart';
import 'package:productify/constans.dart';
import 'package:productify/generated/l10n.dart';

class HomeScreenHeader extends StatelessWidget implements PreferredSizeWidget{
  const HomeScreenHeader({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Header(
      title: S.of(context).app_bar_title,
      backBtn: false,
      actions: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          width: 38,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.all(Radius.circular((5))),
          ),
          child: GestureDetector(
            child: Icon(Icons.add_outlined,
                  size: 26, color: kPrimaryColor),
            onTap: () { print("I was tapped!"); },
          ),
      ),
      ],
    );
  }
}