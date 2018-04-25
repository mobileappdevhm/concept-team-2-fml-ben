import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/fragments/mapFragment.dart';
import 'package:demo_muas_sliding/fragments/MyClasses.dart';
import 'package:demo_muas_sliding/fragments/departmentsFragment.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/pages/settingsPage.dart';

class HomePage extends StatefulWidget {

  final List<Department> departments;

  HomePage(this.departments);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
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
          new MyClasses(),
          new MapFragment(),
          new DepartmentsFragment(departments: widget.departments,),
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