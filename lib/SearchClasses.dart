import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import './ClassInfo.dart';
//import './FacultyInfo.json' as jsonText;
import 'dart:convert';
import 'dart:io';

class SearchClasses extends StatefulWidget {
  SearchClasses({Key key, this.title}) : super(key: key);

  static const String routeName = "/SearchClasses";

  final String title;

  @override
  _SearchClassesState createState() => new _SearchClassesState();
}

/// // 1. After the page has been created, register it with the app routes
/// routes: <String, WidgetBuilder>{
//   SearchClasses.routeName: (BuildContext context) => new SearchClasses(title: "SearchClasses"),
/// },
///
/// // 2. Then this could be used to navigate to the page.
// Navigator.pushNamed(context, SearchClasses.routeName);
///

class _SearchClassesState extends State<SearchClasses> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          backgroundColor: Colors.red,
        ),
        body: new Container(
          child:new ListView(children: getAvaliableClasses(),),
        )
    );
  }

  List<Widget> getAvaliableClasses() {
    String jsonText = '''[{
 "FKN": 1,
  "course_name": "Compiler Construction",
  "professor_name": "Beckie",
  "classroom_name": "Kingswood",
  "building_name": "Sherland",
  "schedule_time": "8:59 PM",
  "schedule_days": "5:26 AM"

}, {
  "FKN": 2,
  "course_name": "Operating Systems",
  "professor_name": "Russell",
  "classroom_name": "Polycote",
  "building_name": "Goslin",
  "schedule_time": "10:57 AM",
  "schedule_days": "9:39 PM"
}, {
  "FKN": 3,
  "course_name": "Secure Network Construction",
  "professor_name": "Peter",
  "classroom_name": "Offer",
  "building_name": "Ferneley",
  "schedule_time": "8:34 PM",
  "schedule_days": "3:28 PM"
}, {
  "FKN": 4,
  "course_name": "Prodder",
  "professor_name": "Langston",
  "classroom_name": "Monery",
  "building_name": "Fireman",
  "schedule_time": "3:01 PM",
  "schedule_days": "3:57 PM"
}, {
  "FKN": 5,
  "course_name": "Konklab",
  "professor_name": "Mireielle",
  "classroom_name": "Brightwell",
  "building_name": "Dresse",
  "schedule_time": "7:08 AM",
  "schedule_days": "10:23 AM"
}, {
  "FKN": 6,
  "course_name": "Daltfresh",
  "professor_name": "Matilde",
  "classroom_name": "Rubenchik",
  "building_name": "Perello",
  "schedule_time": "11:11 PM",
  "schedule_days": "5:06 AM"
}, {
  "FKN": 1,
  "course_name": "Compiler Construction",
  "professor_name": "Beckie",
  "classroom_name": "Kingswood",
  "building_name": "Sherland",
  "schedule_time": "8:59 PM",
  "schedule_days": "5:26 AM"
}, {
  "FKN": 2,
  "course_name": "Operating Systems",
  "professor_name": "Russell",
  "classroom_name": "Polycote",
  "building_name": "Goslin",
  "schedule_time": "10:57 AM",
  "schedule_days": "9:39 PM"
}, {
  "FKN": 3,
  "course_name": "Secure Network Construction",
  "professor_name": "Peter",
  "classroom_name": "Offer",
  "building_name": "Ferneley",
  "schedule_time": "8:34 PM",
  "schedule_days": "3:28 PM"
}, {
  "FKN": 4,
  "course_name": "Prodder",
  "professor_name": "Langston",
  "classroom_name": "Monery",
  "building_name": "Fireman",
  "schedule_time": "3:01 PM",
  "schedule_days": "3:57 PM"
}, {
  "FKN": 5,
  "course_name": "Konklab",
  "professor_name": "Mireielle",
  "classroom_name": "Brightwell",
  "building_name": "Dresse",
  "schedule_time": "7:08 AM",
  "schedule_days": "10:23 AM"
}, {
  "FKN": 6,
  "course_name": "Daltfresh",
  "professor_name": "Matilde",
  "classroom_name": "Rubenchik",
  "building_name": "Perello",
  "schedule_time": "11:11 PM",
  "schedule_days": "5:06 AM"
}, {
  "FKN": 6,
  "course_name": "Daltfresh",
  "professor_name": "Matilde",
  "classroom_name": "Rubenchik",
  "building_name": "Perello",
  "schedule_time": "11:11 PM",
  "schedule_days": "5:06 AM"
}]''';

    //Map<String, dynamic> Class = json.decode(jsonText);

    List jsonCourses = JSON.decode(jsonText);
    // Map jsonCourses = JSON.decode(jsonText);
    //print('${jsonCourses[1]['car1']['course_name']}');
    //print(jsonCourses);
    String jsonString = JSON.encode(jsonCourses[1]);
    // List jsonList = JSON.decode(jsonString);
    Map jsonMap = JSON.decode(jsonString);
    //String jsonCourse2 = JSON.encode(jsonList[1]);
    //Map jsonMap2 = JSON.decode(jsonCourse2);

    List<Widget> ClassList = <Widget>[];

    ClassList.add(
        new Form(child: new TextFormField(
          onSaved: null,
          decoration: new InputDecoration(labelText: " Search Classes",
              labelStyle: new TextStyle(fontSize: 20.0)),
        ),
        )
    );

    for (int i = 0; i < 20; i++) {

      // print('${jsonMap2['course_name']}');
      ClassList.add(
        new ExpansionTile(
          title: new Text('${jsonMap['course_name']}'),
          //title: new Text('course_name'),

          children: <Widget>[
            new Padding(padding: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 8.0)),
            new Row(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

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
                new Column(
                  children: <Widget>[
                    new Padding(
                        padding: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 8.0)),
                    new IconButton(icon: new Icon(Icons.info,size: 60.0,), onPressed: getMoreInfo),
                  ],),
                new Column(
                  children: <Widget>[
                    new Padding(
                        padding: new EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 8.0)),
                    new IconButton(icon: new Icon(Icons.add_circle,size: 60.0,color: Colors.blue,), onPressed: addMyClass),


                  ],),
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

  addMyClass() {
    //should add class to My Class in sqlite if we go that route.
    globals.count++;
  }
}