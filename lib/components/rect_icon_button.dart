import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class RectIconButton extends StatelessWidget {
  const RectIconButton({
    Key key,
    @required this.oldContext,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  final BuildContext oldContext;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.all(Radius.circular((5))),
      ),
      child: InkWell(
        child: Icon(icon, size: 20, color: kPrimaryColor),
        splashColor: Colors.transparent,  
        highlightColor: Colors.transparent,
        onTap: () => onTap(),
      )
    );
  }
}