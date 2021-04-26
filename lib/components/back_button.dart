import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.0,
        top: 10.0,
        left: 20.0,
      ),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.all(Radius.circular((5))),
      ),
      child: InkWell(
        child: Icon(Icons.arrow_back_ios_rounded, size: 20, color: kPrimaryColor),
        splashColor: Colors.transparent,  
        highlightColor: Colors.transparent,
        onTap: () => Navigator.of(context).pop(),
      )
    );
  }
}