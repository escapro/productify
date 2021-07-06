import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productify/components/card_list_item.dart';
import 'package:productify/constans.dart';

class TaskListItem extends StatelessWidget {

  static const activityName = "АКТИВНОСТЬ";

  final title;
  final category;
  final flow;
  final activity;

  const TaskListItem({
    Key key,
    this.title,
    this.category,
    this.flow,
    this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardListItem(
        iconSlideAction: [
          IconSlideAction(
            iconWidget: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryGreenColor
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
              color: kPrimaryYellowColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: const Icon(Icons.timer,
                      size: 30, color: Colors.white)
                ),
              ],
            ),
            ),
            onTap: () => print("sad"),
          )
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            iconWidget: Container(
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryRedColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: const Icon(Icons.close,
                      size: 30, color: Colors.white)
                ),
              ],
            ),
            ),
            onTap: () => print("sad"),
          )
        ],
        child: Container(
          height: 100,
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFECECEC),
                spreadRadius: 4,
                blurRadius: 23,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],  
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: SvgPicture.asset('assets/icons/suitcase.svg'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        )),
                        Text(category, style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold
                        ))
                      ],
                    ),
                    Text(flow, style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold
                        ))
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/chevron_right.svg'),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 3),
                        child: SvgPicture.asset('assets/icons/pulse.svg'),
                      ),
                      Text("$activity%", style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal
                      ))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}