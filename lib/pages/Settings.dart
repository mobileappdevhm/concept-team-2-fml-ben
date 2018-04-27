import 'package:flutter/material.dart';

import 'LogIn.dart';

class MySettingsPage extends StatefulWidget {

  @override
  SettingsPageState createState() => new SettingsPageState();

}

class SettingsPageState extends State<MySettingsPage> {

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

  void _openLogIn() {
    Navigator.push(context, new MaterialPageRoute(
      builder: (context) => new LogInPage())
    );
  }

  @override
  Widget build(BuildContext context) {

    checkedList.add(false);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Settings"),
        actions: <Widget>[
          new MaterialButton(
            child: new Text("Log In"),
            onPressed: _openLogIn,
          )
        ],
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text("Settings", style: new TextStyle(fontWeight: FontWeight.bold),),
            ),
            new CheckboxListTile(
              title: new Text("Setting one/Demo setting"),
              value: checkedList[0],
              onChanged: (checked) {
                onChecked(checked, 0);
              },
            )
          ],
        ),
      ),
    );
  }
}