import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class SectionTitle extends StatelessWidget {

  final String title;
  
  SectionTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Text(title, style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ))
              ),
      ],
    );
  }

}