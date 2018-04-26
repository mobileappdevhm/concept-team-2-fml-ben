import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/fragments/mapFragment.dart';
import 'package:demo_muas_sliding/fragments/selectionFragment.dart';
import 'package:demo_muas_sliding/fragments/departmentsFragment.dart';
import 'package:demo_muas_sliding/pages/settingsPage.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController controller = new PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Courses in English", textAlign: TextAlign.left,),
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
          new SelectionFragment(),
          new MapFragment(),
          new DepartmentsFragment(),
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
