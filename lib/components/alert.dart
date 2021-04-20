import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productify/constans.dart';

class Alert extends StatelessWidget {

  List<String> types = ['info', 'warning', 'error', 'success'];
  String type;
  String text;

  Alert({
    Key key, this.type, this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding / 2, right: kDefaultPadding, left: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: type == 'info' ? kSecondaryLightColor : null,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: type == 'info' ? SvgPicture.asset('assets/icons/info_icon.svg') : null,
          ),
          Expanded(
            child: Text(text, style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: type == 'info' ? kSecondaryColor : null
            ))
            )
        ],
      ),
    );
  }
}