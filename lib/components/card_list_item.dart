import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productify/constans.dart';


class CardListItem extends StatelessWidget {
  const CardListItem({
    Key key, this.child, this.iconSlideAction, this.secondaryActions
  }) : super(key: key);

  final Widget child;
  final List<Widget> iconSlideAction;
  final List<Widget> secondaryActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15,
        right: kDefaultPadding,
        left: kDefaultPadding
      ),
      child: Slidable(
        actionPane: SlidableBehindActionPane(),
        actions: iconSlideAction,
        actionExtentRatio: 1 / 4.5,
        secondaryActions: secondaryActions,
        child: child
      ),
    );
  }
}