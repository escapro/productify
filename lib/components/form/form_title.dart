import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class FormTitle extends StatelessWidget {

  final String title;
  
  FormTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Text("Вид задачи")
      );
  }

}