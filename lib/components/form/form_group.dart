import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class FormGroup extends StatelessWidget {

  final List<Widget> children;

  FormGroup({
    Key key, this.children
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding + 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}