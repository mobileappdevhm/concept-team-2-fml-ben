import 'package:flutter/material.dart';
import 'globals.dart' as globals;
//import 'GlobalFunctions.dart';
import './ClassInfo.dart';


class AvaliableClass extends StatefulWidget {
  AvaliableClass({Key key}) : super(key: key);

  @override
  _AvaliableClassState createState() => new _AvaliableClassState();
}

class _AvaliableClassState extends State<AvaliableClass>{
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
    for (int i = 0; i < 5; i++) {
      ClassList.add(
        new ExpansionTile(
          title: new Text("STRING STING"),
          children: <Widget>[
            new Padding(padding: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 8.0)),
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
                  onPressed: () => getMoreInfo(),
                  child: new Text("i",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    ),
                  ),
                ),
                new Padding(
                    padding: new EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 8.0)),
                new FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () => addMyClass(),
                  //onPressed: null,
                  child: new Text("+",
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


  getMoreInfo() {
//getMoreInfo(BuildContext context) {
    Navigator.pushNamed(this.context, ClassInfo.routeName);
    //navigate to new page, I dont think a navigation here will work as it does depend on context, might need to pass in something, somehow?????
    //Need Context to be passed in but this ListView is made before the context...... Interesting problem.
  }

  addMyClass() {
    //should add class to My Class in sqlite if we go that route.
    //Getting wierd crash when i call this.
    globals.count++;
  }
}