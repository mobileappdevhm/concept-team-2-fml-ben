import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/model/course.dart';
import 'package:demo_muas_sliding/widgets/courseCard.dart';

// TODO improve Dialog
class CourseDialog extends StatelessWidget {

  final Course course;
  final bool isSelected;
  final FavoriteListener listener;

  CourseDialog(this.course, this.isSelected, this.listener);

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
              'Lorem ipsum',
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
              listener.onCourseSelected(course);
            },
            child: new Text(
              isSelected ? 'Remove Course from Selection' : 'Add Course to Selection',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontSize: 20.0
              ),
            ),
            color: isSelected ? Colors.red : Colors.green,
            textColor: Colors.white,
          ),
        )
      ],
    );
  }

}