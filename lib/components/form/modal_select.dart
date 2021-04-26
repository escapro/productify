import 'package:flutter/material.dart';
import 'package:productify/components/modal_dialog.dart';
import 'package:productify/constans.dart';

class ModalSelectType {
  static const int standart = 1;
  static const int radio = 2;
  static const int checkbox = 3;
}

class ModalSelect extends StatefulWidget {

  final String title;
  final List<String> items;
  final int type = ModalSelectType.standart;
  final Function onChange;
  final int value;
  
  ModalSelect({
    Key key,
    this.title,
    this.value,
    @required this.onChange,
    @required this.items
  }) : super(key: key);

  @override
  _ModalSelectState createState() => _ModalSelectState();
}

class _ModalSelectState extends State<ModalSelect> {

  ModalDialog selectModalDialog;
  int _value;
  Function setStateFunc;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => {
      if(widget.value != null) {
        setState(() {
          _value = widget.value - 1;
        })
      } 
    });
  }

  @override
  Widget build(BuildContext context) {

    buildModalDialog(context);

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.only(
                left: kDefaultPadding
              ),
              height: kDefaultElementHeight,
              decoration: BoxDecoration(
                color: kPrimaryLightGreyColor,
                borderRadius: BorderRadius.circular(kDefaultBorderRadius)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildBlockText(),
                  Container(
                    child: const Icon(Icons.arrow_right_rounded,
                                size: 40, color: kFormTitleColor),
                  )
                ]
              )
            ),
            onTap: () => selectModalDialog.show(),
          ),
        ),
      ]
    );
  }

  Text buildBlockText() {
    if(_value != null) {
      return Text(widget.items.elementAt(_value), style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: kFormTitleColor
      ));
    }else {
      return Text("Выберите поток", style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: kFormTitleColor.withOpacity(0.5)
      ));
    }
  }

  buildModalDialog(BuildContext context) {
    return selectModalDialog = new ModalDialog(
      context: context,
      title: widget.title != null ? widget.title : null,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // children: widget.items.asMap().entries.map((item) {
          //   int index = item.key;
          //   String value = item.value;
          //   return listItem(context, value, index);
          // }).toList(),
          children: widget.items.asMap().entries.map((item) {
              int index = item.key;
              String value = item.value;
              return listItem(context, value, index);
            }).toList(),
          ),
      ),
      actions: {"Отмена": () => Navigator.of(context).pop()}
    );
  }

  Column listItem(BuildContext context, String item, int index) {
    return Column(
      children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding/2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item, style: Theme.of(context).textTheme.subtitle1.copyWith(
                  
                )),
                buildItemIcon(index)
              ],
            ),
          ),
          onTap: () => onModalSelectTap(context, index)
        ),
        if(index + 1 != widget.items.length)
        Divider()
      ],
    );
  }

  Widget buildItemIcon(int index) {
    if(_value == index) {
      return const Icon(Icons.radio_button_checked_rounded,
                      size: 20, color: kPrimaryColor);
    }else {
      return const Icon(Icons.radio_button_off_rounded,
                      size: 20, color: kPrimaryGreyColor);
    }
  }

  void onSelectBlockTap(BuildContext context) {
    selectModalDialog.show();
    // showDialog(
    //   context: context,
    //   builder: (_) => StatefulBuilder(
    //     builder: (context, setState) {
    //       return Dialog(
    //         child: GestureDetector(
    //           child: Text(_value.toString()),
    //           onTap: () {
    //             setState(() {
    //             _value = 3;
    //           });
    //           print("as");
    //           },
    //         ),
    //       );
    //     }
    //   )
    // );
  }

  void onModalSelectTap(BuildContext context, int index) {

    setState(() {
      _value = index;
      widget.onChange(index + 1);
    });

    selectModalDialog.close();
  
  }
}