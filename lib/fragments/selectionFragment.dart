import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/globals.dart' as globals;
import 'package:demo_muas_sliding/ClassInfo.dart';

class SelectionFragment extends StatefulWidget {
  SelectionFragment({Key key}) : super(key: key);

  @override
  _SelectionFragment createState() => new _SelectionFragment();
}

class _SelectionFragment extends State<SelectionFragment> {

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = getMyClasses();
    widgets.add(new Padding(
      padding: new EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
      child: new RaisedButton(
        onPressed: () {},
        color: Colors.green,

        child: new Text(
          'Submit your Selection!',
          style: new TextStyle(
              fontSize: 20.0,
              color: Colors.white
          ),
        ),
      ),
    ));
    return new ListView(
      children: widgets,
    );
  }

  List<Widget> getMyClasses() {
    List<Widget> ClassList = <Widget>[];
    //Poll database for information and number of entries.
    for (int i = 0; i < globals.count; i++) {
      ClassList.add(
        new ExpansionTile(
          title: new Text("MyClass :" + i.toString()),
          children: <Widget>[
            new Padding(padding: new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 8.0)),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                    children: <Widget>[
                      new Padding(
                          padding: new EdgeInsets.fromLTRB(28.0, 0.0, 0.0, 0.0)),
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
                new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
//                    new Padding(
//                        padding: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 8.0)),
                    new IconButton(icon: new Icon(Icons.info,size: 60.0,), onPressed: getMoreInfo),
                    new Padding(
                        padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0)),
                  ],
                ),
                //TODO: let user add notes about the class aka where lab is!!!!
              ],
            ),
          ],
        ),
      );
    }
    return ClassList;
  }

  getMoreInfo() {
    Navigator.pushNamed(this.context, ClassInfo.routeName);
  }
}