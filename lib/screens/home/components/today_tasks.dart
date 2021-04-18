import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productify/constans.dart';

class TodayTasks extends StatelessWidget {
  const TodayTasks({
    Key key,
    String title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < 50; i++) 
        CardListItem(
          title: 'Монтировать видео',
        ),
      ],
    );
  }
}

class CardListItem extends StatelessWidget {
  const CardListItem({
    Key key, this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
        right: kDefaultPadding,
        left: kDefaultPadding
      ),
      child: Slidable(
      actionPane: SlidableBehindActionPane(),
      actions: <Widget>[
        IconSlideAction(
          iconWidget: Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kSecondaryColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: const Icon(Icons.check,
                    size: 30, color: Colors.white)
              ),
            ],
          ),
          ),
          onTap: () => print("sad"),
        ),
        IconSlideAction(
          iconWidget: Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: const Icon(Icons.time_to_leave,
                    size: 30, color: Colors.white)
              ),
            ],
          ),
          ),
          onTap: () => print("sad"),
        )
      ],
      actionExtentRatio: 1 / 4.5,
      child: Container(
        height: 100,
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: SvgPicture.asset('assets/icons/suitcase.svg'),
            ),
            Text(title, style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ))
          ],
        ),
      ),
        ),
    );
  }
}