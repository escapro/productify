import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class ButtonSelect extends StatelessWidget {

  final List items;
  
  ButtonSelect({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          for (var i = 0; i < items.length; i++)
          Expanded(
            flex: 1,
            child: Container(
              margin: items.length != i+1 ? EdgeInsets.only(right: 5) : null,
              // padding: EdgeInsets.all(10),
              height: 60,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child:
                Text(items[i].toString(), style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold
                ))
              )
            ),
          )
        ]
      )
      );
  }

}