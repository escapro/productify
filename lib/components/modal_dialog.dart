import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

class ModalDialog{

  final BuildContext context;
  final String title;
  final Widget body;
  final Map<String, Function> actions;
  StateSetter setStateFunc;

  ModalDialog({
    @required this.context,
    this.title,
    @required this.body,
    this.actions
  });

  show() {
    
    Size size = MediaQuery.of(context).size;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              child: Container(
                height: size.height / 1.5,
                width: size.width,
                padding: EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  top: kDefaultPadding,
                  bottom: kDefaultPadding/2
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if(title != null)
                    buildHeader(),
                    buildBody(),
                    if(actions != null && actions.length > 0)
                    buildActions()
                  ],
                ),
                ),
              );
          }
        );
      }
    );
  }

  close() {
    Navigator.of(context).pop();
  }

  Row buildActions() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: actions.entries.map((action) {
              return TextButton (
                onPressed: () => action.value(),
                child: Text(action.key, style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16.0)
                )
              );
            }).toList()
          );
  }

  Expanded buildBody() {
    return Expanded(
            child: Container(
              child: body,
            ),
          );
  }

  Container buildHeader() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: kDefaultPadding/2),
      child: Text(title, style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500
      )),
    );
  }
}