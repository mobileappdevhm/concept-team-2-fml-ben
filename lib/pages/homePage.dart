import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/fragments/mapFragment.dart';
import 'package:demo_muas_sliding/fragments/selectionFragment.dart';
import 'package:demo_muas_sliding/fragments/departmentsFragment.dart';
import 'package:demo_muas_sliding/model/course.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/pages/settingsPage.dart';
import 'dart:collection';

class HomePage extends StatefulWidget {

  final List<Department> departments;

  HomePage(this.departments);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements SelectionListener {

  PageController controller = new PageController();
  int index = 0;
  Map<Department, List<Course>> selection = new HashMap();

  @override
  void initState() {
    super.initState();
    for (Department department in widget.departments) {
      selection.putIfAbsent(department, () => []); // Create empty List for Department
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MUAS DEMO", textAlign: TextAlign.left,),
        backgroundColor: Colors.red,
        actions: [
          new IconButton(
            icon: new Icon(Icons.settings, color: Colors.white,),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new SettingsPage())
              );
            }
          )
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
          new SelectionFragment(selection),
          new MapFragment(),
          new DepartmentsFragment(
            widget.departments,
            this
          ),
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

  @override
  void select(Department department, Course course) {
    setState(() {
      if (selection[department].contains(course)) {
        selection[department].remove(course);
      } else {
        selection[department].add(course);
      }
    });
  }
}

abstract class SelectionListener {
  void select(Department department, Course course);
}