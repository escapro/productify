import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class DatePickerType {
  static const int date = 1;
  static const int time = 2;
}

class DatePicker extends StatefulWidget {

  final TimeOfDay controller;
  final int type;
  final Function onChange;

  DatePicker({
    Key key, this.onChange, this.controller, this.type=DatePickerType.date
  }) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  TimeOfDay _value;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => {
      if(widget.controller != null) {
         setState(() {
            _value = widget.controller;
          })
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            // child: buildDatePicker(),
            child: _value != null ? buildSelectedDate() : buildDatePicker(),
            onTap: () => onPickerTap(context),
          ),
        ),
      ],
    );
  }

  Container buildSelectedDate() {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
            height: kDefaultElementHeight,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: kDefaultPadding/2),
                      child: const Icon(Icons.access_time_sharp,
                            size: 30, color: Colors.white),
                    ),
                    Text("${_value.hour.toString()}:${_value.minute.toString()}", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    )),
                  ],
                ),
                 GestureDetector(
                  child: Container(
                        margin: EdgeInsets.only(right: kDefaultPadding/2),
                        child: const Icon(Icons.close_rounded,
                              size: 30, color: Colors.white),
                      ),
                  onTap: () => clearData(),
                 ),
              ],
            )
          );
  }

  Container buildDatePicker() {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: kDefaultElementHeight,
            decoration: BoxDecoration(
              color: kPrimaryLightGreyColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius)
            ),
            child: Center(
              child: Text("ДОБАВИТЬ НАПОМИНАНИЕ", style: TextStyle(
                color: kSecondaryColor,
                fontSize: 14.0,
                fontWeight: FontWeight.bold
              )),
            ),
          );
  }

  void onPickerTap(BuildContext context) {

    if(widget.type == DatePickerType.time) {

       Future<TimeOfDay> selectedTime = showTimePicker(
        context: context,
        initialTime: widget.controller != null ? widget.controller : TimeOfDay.now(),
        helpText: "Выберите время напоминания",
        confirmText: "ДОБАВИТЬ"
      );

      selectedTime.then((value) {
        if(value != null) {
          setState(() {
            _value = value;
          });
          widget.onChange(_value);
        }
      });

    }else if(widget.type == DatePickerType.date){
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
    }   
  }

  void clearData() {
    setState(() {
        _value = null;
    });
    widget.onChange(null);
  }
}