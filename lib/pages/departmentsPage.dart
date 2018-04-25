import 'package:flutter/material.dart';
import '../model/department.dart';
import '../widgets/departmentTile.dart';

class DepartmentsPage extends StatefulWidget {
  DepartmentsPage({Key key, this.title, this.departments}) : super(key: key);

  final String title;
  final List<Department> departments;

  @override
  _DepartmentsPageState createState() => new _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new GridView.count(
          crossAxisCount: 2,
          children: widget.departments.map((department) {
            return new Padding(
              padding: new EdgeInsets.only(
                  left: 4.0,
                  right: 4.0,
                  top: 4.0
              ),
              child: new DepartmentTile(
                  department
              ),
            );
          }).toList()
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard),
              title: new Text('Departments')
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.map),
              title: new Text('Maps')
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text('My Selection')
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
