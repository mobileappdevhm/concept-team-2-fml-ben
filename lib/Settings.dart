import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {

  @override
  SettingsPageState createState() => new SettingsPageState();

}

class SettingsPageState extends State<SettingsPage> {

  List<bool> checkedList = new List<bool>();

  void switchSettingOne() {

  }

  void onChecked(bool checked, int button) {
    setState(() {
      // print("isChecked: " + isChecked.toString());
      checkedList[button] = checked;
      // print(" 2. isChecked: " + checkedList[button].toString());
    });
  }

  @override
  Widget build(BuildContext context) {

    checkedList.add(false);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Settings"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new CheckboxListTile(
              value: checkedList[1],
                  onChanged: (checked) {
                    onChecked(checked, 1);
                  },
            )
          ],
        ),
      ),
    );
  }
}