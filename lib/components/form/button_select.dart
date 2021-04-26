import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class ButtonSelect extends StatefulWidget {

  final List items;
  final Function onChange;
  
  ButtonSelect({Key key, this.items, this.onChange}) : super(key: key);

  @override
  _ButtonSelectState createState() => _ButtonSelectState();
}

class _ButtonSelectState extends State<ButtonSelect> {

  int _value = 1;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          for (var i = 0; i < widget.items.length; i++)
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: Container(
                margin: widget.items.length != i+1 ? EdgeInsets.only(right: 10) : null,
                padding: EdgeInsets.all(10),
                height: kDefaultElementHeight,
                decoration: BoxDecoration(
                  color: _value != i+1 ? Color(0xFFF1F2F5) : kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child:
                  Text(widget.items[i].toString(), style: TextStyle(
                    color: _value != i+1 ? kSecondaryColor : Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold
                  ))
                )
              ),
              onTap: () => _changeSelector(i+1),
            ),
          )
        ]
      )
      );
  }

  _changeSelector(int index) {
    setState(() {
      _value = index;
    });
    
    widget.onChange(index);
  }
}