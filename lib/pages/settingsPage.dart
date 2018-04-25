import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text('Settings'),
      ),
      body: new Center(
        child: new Image.asset('assets/placeholder.png'),
      ),
    );
  }

}