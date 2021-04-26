import 'package:flutter/material.dart';
import 'package:productify/constans.dart';
import 'package:productify/generated/l10n.dart';

class WeekSelectionTypes {
  static const int single = 1;
  static const int multi = 2;
}

class WeekSelection extends StatefulWidget {

  final List<int> defaultValues;
  final Function onChange;
  final int type;

  WeekSelection({
    Key key, this.defaultValues, this.onChange, this.type=WeekSelectionTypes.single
  }) : super(key: key);

  @override
  _WeekSelectionState createState() => _WeekSelectionState();
}

class _WeekSelectionState extends State<WeekSelection> {

  List<int> _values = [];

  @override
  void initState() {
    super.initState();
    
    widget.defaultValues != null ? _values = widget.defaultValues : _values = [];
    
    if(_values.length > 0) {
      if(widget.type == WeekSelectionTypes.single) {
        int value = _values[0];
        _values = [];
        _values.add(value);
      }

      WidgetsBinding.instance.addPostFrameCallback((_) => {
        widget.onChange(_values)
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: generateButtons(context)
    );
  }

  Row generateButtons(BuildContext context) {

    List<String> week = [];
    List<Widget> buttons = [];

    [
      S.of(context).week1,
      S.of(context).week2,
      S.of(context).week3,
      S.of(context).week4,
      S.of(context).week5,
      S.of(context).week6,
      S.of(context).week7,
    ].asMap().forEach((key, value) {
      week.add(value);
      buttons.add(weekButton(text: value, index: key+1, isActive: _values.contains(key+1) ? true : false));
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons,
    );
  }

  GestureDetector weekButton({String text, int index, bool isActive=false}) {
    return  GestureDetector(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? kPrimaryColor : kPrimaryLightGreyColor
                ),
                child: Center(child: Text(text, style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.white : kSecondaryColor
                ))),
              ),
              onTap: () => onWeekButtonTap(index),
            );
  }

  void onWeekButtonTap(int index) {
  
    if(widget.type == WeekSelectionTypes.single) {
  
      setState(() {
        if(_values.length > 0) {
          _values = [];
        }

        _values.add(index);
      });

    }else if(widget.type == WeekSelectionTypes.multi) {

      if(_values.contains(index)) {
        setState(() {
          _values.remove(index);
        });
      }else {
        setState(() {
          _values.add(index);
        });
      }    
    }

    _values.sort();
    widget.onChange(_values);
  }
}