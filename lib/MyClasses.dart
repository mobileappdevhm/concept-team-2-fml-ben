import 'package:flutter/material.dart';
import 'globals.dart' as globals;
//import 'GlobalFunctions.dart';

class MyClasses extends StatefulWidget {
  MyClasses({Key key}) : super(key: key);

  @override
  _MyClassesState createState() => new _MyClassesState();
}

class _MyClassesState extends State<MyClasses> {

  @override
  Widget build(BuildContext context) {
    List<Widget> ClassList = getMyClasses();
    Scaffold scaffold = new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text("Avaliable Classes"),
      ),
      body: new ListView(children: ClassList,),
    );
    return scaffold;
  }

  List<Widget> getMyClasses() {
    List<Widget> ClassList = <Widget>[];
    //Poll database for information and number of entries.
    for (int i = 0; i < globals.count; i++) {
      ClassList.add(
        new ExpansionTile(
          title: new Text("MyClass :"+ i.toString()),
          children: <Widget>[
            new Padding(padding: new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 8.0)),
            new Row(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                new Column(
                    children: <Widget>[
                      new Padding(
                          padding: new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0)),
                      new Text(
                        'Class Time',
                        style: new TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      new Text(
                        'Class Location',
                        style: new TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ]
                ),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 8.0)),
                new FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: null,
                  child: new Text("i",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    ),
                  ),
                ),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0)),

              ],
            ),
          ],
        ),


      );
    }
    return ClassList;
  }
}