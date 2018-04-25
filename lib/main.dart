import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/fragments/MapPage.dart';
import 'package:demo_muas_sliding/fragments/MyClasses.dart';
import 'package:demo_muas_sliding/ClassInfo.dart';
import 'package:demo_muas_sliding/SearchClasses.dart';
import 'package:demo_muas_sliding/fragments/departmentsFragment.dart';
import 'package:demo_muas_sliding/model/department.dart';

void main() => runApp(new MyApp());

int count = 0;

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'demo_muas_sliding',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: <String, WidgetBuilder>{
        ClassInfo.routeName: (BuildContext context) => new ClassInfo(),
        SearchClasses.routeName: (BuildContext context) => new SearchClasses(title: "SearchClasses"),

      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  List<Department> departments = [
    new Department(
        'FK 01',
        'Department 01',
        'Department of Architecture',
        Colors.indigo,
        'Campus Karlstraße'
    ),
    new Department(
        'FK 02',
        'Department 02',
        'Department of Civil Engineering',
        Colors.cyan,
        'Campus Karlstraße'
    ),
    new Department(
        'FK 03',
        'Department 03',
        'Department of Mechanical, Automotive and Aeronautical Engineering',
        Colors.blue,
        'Campus Lothstraße'
    ),
    new Department(
        'FK 04',
        'Department 04',
        'Department of Electrical Engineering and Information Technology',
        Colors.cyan,
        'Campus Lothstraße'
    ),
    new Department(
        'FK 05',
        'Department 05',
        'Department of Building Services Engineering, Chemical Engineering for Paper and Packaging, Print and Media Technologies',
        Colors.indigo,
        'Campus Lothstraße'
    ),
    new Department(
        'FK 06',
        'Department 06',
        'Department of Applied Sciences and Mechatronics',
        Colors.indigo,
        'Campus Lothstraße'
    ),
    new Department(
        'FK 07',
        'Department 07',
        'Department of Computer Science and Mathematics',
        Colors.teal,
        'Campus Lothstraße'
    ),
    new Department(
        'FK 08',
        'Department 08',
        'Department of Geoinformations',
        Colors.cyan,
        'Campus Karlstraße'
    ),
    new Department(
        'FK 09',
        'Department 09',
        'Department of Engineering and Management',
        Colors.lightGreen,
        'Campus Lothstraße'
    ),
    new Department(
        'FK 10',
        'Department 10',
        'Department of Business Administration',
        Colors.green,
        'Campus Pasing'
    ),
    new Department(
        'FK 11',
        'Department 11',
        'Department of Applied Social Sciences',
        Colors.orange,
        'Campus Pasing'
    ),
    new Department(
        'FK 13',
        'Department 13',
        'Department of General and Interdisciplinary Studies',
        Colors.purple,
        'Campus Lothstraße'
    ),
  ];

  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  PageController controller = new PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MUAS DEMO", textAlign: TextAlign.left,),
        backgroundColor: Colors.red,
        actions: [
          new IconButton(icon: new Icon(Icons.settings, color: Colors.white,), onPressed: null)
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(icon: new Icon(Icons.assignment), title: new Text('My Selection')),
          new BottomNavigationBarItem(icon: new Icon(Icons.map), title: new Text('Maps')),
          new BottomNavigationBarItem(icon: new Icon(Icons.dashboard), title: new Text('Departments')),
        ],
        onTap: (index) {
          setState(() {
            controller.jumpToPage(index);
          });
        },
        currentIndex: index,
      ),
      body: new PageView(
        children: <Widget>[
          new MyClasses(),
          new MapPage(),
          new DepartmentsFragment(departments: widget.departments,)
        ],
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}
