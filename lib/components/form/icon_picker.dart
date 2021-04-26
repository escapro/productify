import 'package:flutter/material.dart';
import 'package:productify/components/modal_dialog.dart';
import 'package:productify/constans.dart';

class IconPicker extends StatefulWidget {

  final int controller;
  final Function onChange;

  IconPicker({
    Key key, this.onChange, this.controller
  }) : super(key: key);

  @override
  _IconPickerState createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {

  int _value;
  ModalDialog iconPickerDialog;
  static const List<int> iconList = [0xeb08, 0xe4b3, 0xe55c, 0xe791, 0xe64d, 0xe0dd, 0xe7cf];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => {
      if(widget.controller != null) {
         setState(() {
            _value = widget.controller;
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
            // child: buildDatePicker(),
            child: _value != null ? buildSelectedIcon() : buildIconPicker(),
            onTap: () => onPickerTap(context),
          ),
        ),
      ],
    );
  }

  ModalDialog buildModalDialog(BuildContext context) {
    return iconPickerDialog = new ModalDialog(
    context: context,
    title: "Выберите иконку",
    body: generateIconList(context),
    actions: {"Отмена": () => Navigator.of(context).pop()}
  );
  }

  Widget generateIconList(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children:[
        for(var icon in iconList)
        IconButton(
          icon: Icon(IconData(icon, fontFamily: 'MaterialIcons'),
            size: 30,
            color: _value == icon ? kPrimaryColor : Colors.grey
          ),
          onPressed: () => onIconTap(icon, context),
        )
      ]);
  }

  onIconTap(int icon, BuildContext context) {
    setState(() {
      _value = icon;
      widget.onChange(icon);
    });
    iconPickerDialog.close();
  }

  Container buildSelectedIcon() {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
            height: kDefaultElementHeight,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Icon(IconData(_value, fontFamily: 'MaterialIcons'), size: 30, color: Colors.white),
                  margin: EdgeInsets.only(right: 5),
                ),
                Text("ИЗМЕНИТЬ ИКОНКУ", style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold
                ))
              ],
            )
          );
  }

  Container buildIconPicker() {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: kDefaultElementHeight,
            decoration: BoxDecoration(
              color: kPrimaryLightGreyColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius)
            ),
            child: Center(
              child: Text("ВЫБРАТЬ ИКОНКУ", style: TextStyle(
                color: kSecondaryColor,
                fontSize: 14.0,
                fontWeight: FontWeight.bold
              )),
            ),
          );
  }

  void onPickerTap(BuildContext context) {
    iconPickerDialog.show();
  }
}