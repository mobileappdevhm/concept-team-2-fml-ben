import 'package:flutter/material.dart';
import './FacultyPage.dart';


class AvaliableClass extends StatefulWidget {
  AvaliableClass({Key key}) : super(key: key);

  @override
  _AvaliableClassState createState() => new _AvaliableClassState();
}

class _AvaliableClassState extends State<AvaliableClass> {
  @override
  Widget build(BuildContext context) {
    List<Widget> ClassList = getAvaliableClasses();

    Scaffold scaffold = new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text("Avaliable Classes"),
      ),
      body: new ListView(children: ClassList,),
    );
    return scaffold;
  }

  List<Widget> getAvaliableClasses() {
    List<Widget> ClassList = <Widget>[];
    //Poll database for information and number of entries.
    for (int i = 1; i < 14; i++) {
      ClassList.add(
        new Container(
          child: new RaisedButton(
            onPressed: () =>
              //(BuildContext context) => new FacultyPage(),
            //Navigator.pushNamed(context, FacultyPage.routeName),
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new FacultyPage(FKN: i,)),
            ),
            child: new Text(
              "Faculty " + i.toString(), style: new TextStyle(fontSize: 20.0),),
            color: Colors.white70,
          ),
          padding: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 00.0),
        ),
      );
    }
    return ClassList;
  }
}