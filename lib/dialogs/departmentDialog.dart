import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/pages/departmentDetailPage.dart';

class DepartmentDialog extends StatelessWidget {

  final Department department;

  DepartmentDialog(this.department);

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      title: new Center(
        child: new Text(
          department.name,
          style: new TextStyle(
              fontSize: 32.0
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
        new Text(
          department.fullName,
          style: new TextStyle(
            fontSize: 24.0,
          ),
          textAlign: TextAlign.center,
        ),
        new Divider(),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              'Location: ',
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            new Text(
              department.location,
              style: new TextStyle(
                fontSize: 20.0
              ),
            )
          ],
        ),
        new Divider(),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              'Courses in English: ',
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            new Text(
              'There are ${department.numberOfCourses} courses in English.',
              style: new TextStyle(
                  fontSize: 20.0
              ),
            )
          ],
        ),
        new Padding(
          padding: new EdgeInsets.only(top: 8.0),
          child: new RaisedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new DepartmentDetailPage(department)
                  )
              );
            },
            child: new Text(
              'Discover Courses',
              style: new TextStyle(
                  fontSize: 20.0
              ),
            ),
            color: department.color,
            textColor: Colors.white,
          ),
        )
      ],
    );
  }

}