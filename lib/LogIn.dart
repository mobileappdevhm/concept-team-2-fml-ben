import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {

  @override
  _LogInPageState createState() => new _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  Future<SharedPreferences> _logInPrefs = SharedPreferences.getInstance();

  final String userID = "username";
  final String passID = "password";

  String username = "Username";
  String password = "Passwort";

  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  bool isChecked = false;

  List<String> allData = new List<String>();

  /// changing the state of the checkbox
  void onChecked(bool checked) {
    setState(() {
      // print("isChecked: " + isChecked.toString());
      isChecked = checked;
      print(" 2. isChecked: " + isChecked.toString());
    });
  }

  void _logMeIn() {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Courses in English"),
        backgroundColor: Colors.black,
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new FutureBuilder<SharedPreferences>(
          future: _logInPrefs,
          builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return const Text("Loading...");

            String myUsername = snapshot.requireData.getString(userID);
            String myPassword = snapshot.requireData.getString(passID);

            if (myUsername.isEmpty || myPassword.isEmpty) {
              myUsername = "Username";
              myPassword = "Passwort";
            }

            // if (username != "Username" || password != "Passwort") {
            //   myUsername = username;
            //   myPassword = password;
            // }

            String obscuredPassword = "";
            if (myPassword.trim() == "Passwort") {
              obscuredPassword = myPassword;
            } else {
              for (int i = 0; i < myPassword.length; i++) {
                obscuredPassword += "*";
              }
            }
            // print("diesen user: " + myUsername + " dieses passowrt: " + obscuredPassword);
            // print("username: " + username + " passwort: " + password);
            return new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(hintText: "$myUsername"),
                  controller: userController,
                ),
                new TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration:
                      new InputDecoration(hintText: "$obscuredPassword"),
                  controller: passController,
                ),
                new CheckboxListTile(
                  title: new Text("Log In Daten speichern"),
                  value: isChecked,
                  onChanged: (checked) {
                    onChecked(checked);
                  },
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new MaterialButton(
                      child: new Text("Log In",
                          style: new TextStyle(
                            color: Colors.white,
                          )),
                      onPressed: _logMeIn,
                      color: Colors.black,
                    ),
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }
}