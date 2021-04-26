import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class Input extends StatelessWidget {

  final TextEditingController controller;
  final String placeholder;
  final int maxLines;
  final int maxLenght;
  final EdgeInsetsGeometry margin;
  final Function onChanged;
  final Function onTap;
  final TextInputType keyboardType;
  final Widget icon;
  final Widget suffixIcon;
  final FocusNode focusNode;
  final FormFieldValidator validation;

  const Input({
    Key key,
    @required this.placeholder,
    this.focusNode,
    this.maxLenght,
    this.controller,
    this.suffixIcon,
    this.icon,
    this.keyboardType,
    this.margin,
    this.onTap,
    this.onChanged,
    this.maxLines,
     this.validation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: maxLines == 1 || maxLines == null ? 50 : null,
      // padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // color: Color(0xFFF1F2F5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if(icon != null)
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: icon,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  maxLength: maxLenght,
                  maxLines: maxLines,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: keyboardType == null ? TextInputType.text : keyboardType,
                  style: TextStyle(
                    color: Color(0xFF33475B),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                  ),
                  decoration: new InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: kDefaultPadding),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            width: 0, 
                            style: BorderStyle.none,
                        ),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF1F2F5),
                    counterText: '',
                    errorBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 1,
                        ),
                    ),
                    hintText: placeholder,
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  validator: validation != null ? validation : null,
                  onTap: onTap,
                  onChanged: onChanged != null ? (value) => onChanged(value) : null,
                ),
              ),
              if(suffixIcon != null)
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: suffixIcon,
              )
            ],
          ),
        );
  }
}