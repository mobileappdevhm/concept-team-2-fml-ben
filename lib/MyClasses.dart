import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class Class {
  bool isExpanded;
  final String header;
  final Widget body;
  Class(this.isExpanded, this.header, this.body);
}

class MyClasses extends StatefulWidget {
  MyClasses({Key key}) : super(key: key);

  @override
  _MyClassesState createState() => new _MyClassesState();
}

class _MyClassesState extends State<MyClasses> {
  List<Class> ClassList = globals.getMyClasses();
//  List<Class> ClassList = <Class>[];
//  for(int i = 0; i < 5; i++) {
//    ClassList.add(
//      new Class(
//      false,
//      "header",
//      new Padding(
//        padding: new EdgeInsets.all(20.0),
//          child: new Column(
//            children: <Widget>[
//              new Text("YOU MADE IT")
//            ]
//          ),
//        ),
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    //Class listArray = [];
//    List<Class> ClassList = <Class>[];
//    for (int i = 0; i < 5; i++) {
//      ClassList.add(
//        new Class(
//          false,
//          "header",
//          new Padding(
//            padding: new EdgeInsets.all(20.0),
//            child: new Column(
//                children: <Widget>[
//                  new Text("YOU MADE IT")
//                ]
//            ),
//          ),
//        ),
//      );
//    }
    ListView Class_List;
    Class_List = new ListView(
      children: [
        new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                ClassList[index].isExpanded = !ClassList[index].isExpanded;
              });
            },
            children: ClassList.map((Class item) {
              return new ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return new ListTile(
                    leading: new Text(
                      item.header,
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),

                    ),
                    trailing: new Icon(Icons.arrow_drop_down),
                  );
                },
                isExpanded: item.isExpanded,
                body: item.body,
              );
            }).toList(),
          ),
        )
      ],
    );
    Scaffold scaffold = new Scaffold(
      appBar: new AppBar(
        title: new Text("Criteria Selection"),
      ),
      body: Class_List,
      persistentFooterButtons: <Widget>[
        new ButtonBar(children: <Widget>[
          new FlatButton(
            color: Colors.blue,
            onPressed: null,
            child: new Text(
              'Apply',
              textAlign: TextAlign.left,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ])
      ],
    );
    return scaffold;


//        new ListTile(
//          title: new Text("Class Longer",
//            style: new TextStyle(
//              fontWeight: FontWeight.w400, fontSize: 20.0
//            ),
//          ),
//          trailing: new Icon(Icons.arrow_drop_down),
//          onTap: getClassData(0) ,
//        )
    //Widget Building tiem

//    return new Container(
//      child: new Center(
//        child: new ListView(
//            children: listArray
//          ),
//        ),
//    );
//  }
  }
//
//  getClassData(int key) {
//    //Query database for words in drop down.
}