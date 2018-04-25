import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import './ClassInfo.dart';
//import './FacultyInfo.json' as jsonText;
import 'dart:convert';
import 'dart:io';

class FacultyPage extends StatefulWidget {
  FacultyPage({Key key, this.FKN}) : super(key: key);

  static const String routeName = "/FacultyPage";

  final int FKN;

  @override
  _FacultyPageState createState() => new _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {


  @override
  Widget build(BuildContext context) {
    List<ExpansionTile> ClassList = getAvaliableClasses();
    Scaffold scaffold = new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text("Faculty "+widget.FKN.toString()),
      ),
      body: new ListView(children: ClassList,),
    );
    return scaffold;
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
    String jsonString = JSON.encode(jsonCourses[widget.FKN]);
   // List jsonList = JSON.decode(jsonString);
    Map jsonMap = JSON.decode(jsonString);
    //String jsonCourse2 = JSON.encode(jsonList[1]);
    //Map jsonMap2 = JSON.decode(jsonCourse2);

    List<ExpansionTile> ClassList = <ExpansionTile>[];

    for (int i = 0; i < 3; i++) {

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
                    new FloatingActionButton(
                      backgroundColor: Colors.blue,
                      heroTag: i,
                      onPressed: () => getMoreInfo(),
                      child: new Text("i",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                        ),
                      ),
                    ),
                  ],),
                new Column(
                  children: <Widget>[
                    new Padding(
                        padding: new EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 8.0)),
                    new FloatingActionButton(
                      backgroundColor: Colors.red,
                      heroTag: i + 5,
                      onPressed: () => addMyClass(),
                      //onPressed: null,
                      child: new Text("+",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                        ),
                      ),
                    ),
                  ],),
              ],
            ),
            new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0)),
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

