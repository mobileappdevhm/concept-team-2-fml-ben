import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/model/course.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/model/backend.dart';

// TODO improve Dialog
class CourseDialog extends StatelessWidget {

  final Department department;
  final Course course;
  final Backend backend = new Backend();

  CourseDialog(this.department, this.course);

  bool get _isSelected {
    return backend.isCourseSelected(department, course);
  }

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      title: new Center(
        child: new Text(
          course.name,
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontSize: 24.0
          ),
        ),
      ),
      contentPadding: new EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          top: 0.0
      ),
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              'Detailed Description: ',
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            new Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, '
                  'sed diam nonumy eirmod tempor invidunt ut labore et dolore '
                  'magna aliquyam erat, sed diam voluptua. At vero eos et '
                  'accusam et justo duo dolores et ea rebum. Stet clita kasd '
                  'gubergren, no sea takimata sanctus est Lorem ipsum dolor '
                  'sit amet.',
              textAlign: TextAlign.justify,
              style: new TextStyle(
                fontSize: 16.0
              ),
            )
          ],
        ),
        new Padding(
          padding: new EdgeInsets.only(top: 8.0),
          child: new RaisedButton(
            padding: new EdgeInsets.all(4.0),
            onPressed: () {
              Navigator.pop(context);
              backend.selectCourse(department, course);
            },
            child: new Text(
              _isSelected ? 'Remove Course from Selection' : 'Add Course to Selection',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontSize: 20.0
              ),
            ),
            color: _isSelected ? Colors.red : Colors.green,
            textColor: Colors.white,
          ),
        )
      ],
    );
  }

}