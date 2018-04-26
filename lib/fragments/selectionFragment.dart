import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/model/backend.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/widgets/courseCard.dart';

class SelectionFragment extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _SelectionFragmentState();

}
//TODO: let user add notes about the class aka where lab is!!!!

class _SelectionFragmentState extends State<SelectionFragment> implements BackendListener {

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = getCourses();
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
      padding: new EdgeInsets.all(0.0),
    );
  }

  List<Widget> getCourses() {
    List<Widget> widgets = [];
    Backend backend = new Backend();
    for (Department department in backend.allDepartments) {
      widgets.addAll(
        backend.allSelectedCoursesByDepartment(department).map((course) => new Padding(
              padding: new EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0, left: 8.0),
              child: CourseCard(department, course)
          )));
    }
    return widgets;
  }

  @override
  void dispose() {
    super.dispose();
    new Backend().removeListener(this);
  }

  @override
  void initState() {
    super.initState();
    new Backend().addListener(this);
  }

  @override
  void onDataChanged(Backend data) {
    setState(() {

    });
  }

}