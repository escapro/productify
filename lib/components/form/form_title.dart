import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class FormTitle extends StatelessWidget {

  final String title;
  
  FormTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          margin: EdgeInsets.only(bottom: 10),
          child: Text(title, style: TextStyle(
            color: Color(0xFF6B7A89),
            fontSize: 18.0,
            fontWeight: FontWeight.w500
          ))
          ),
      ],
    );
  }

}