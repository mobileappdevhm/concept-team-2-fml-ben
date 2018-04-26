import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/model/backend.dart';
import 'package:demo_muas_sliding/model/course.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/dialogs/courseDialog.dart';

class CourseCard extends StatelessWidget {

  final Department department;
  final Course course;
  final Backend backend = new Backend();
  bool _isSelected;

  CourseCard(this.department, this.course) {
    _isSelected = backend.isCourseSelected(department, course);
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0, bottom: 4.0),
      child: new Card(
        child: new FlatButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => new CourseDialog(department, course)
              );
            },
            padding: new EdgeInsets.all(8.0),
            child: new Row(
              children: <Widget>[
                new Flexible(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          course.name,
                          style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        new Row(
                          children: <Widget>[
                            new Text('Lecturer:  ', style: new TextStyle(fontWeight: FontWeight.bold),),
                            new Padding(
                              padding: new EdgeInsets.only(left: 4.0),
                              child: new Text(
                                course.lecturer,
                                style: new TextStyle(fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                        new Row(
                          children: <Widget>[
                            new Text('Credit Points: ', style: new TextStyle(fontWeight: FontWeight.bold),),
                            new Padding(
                              padding: new EdgeInsets.only(left: 4.0),
                              child: new Text(
                                '${course.ectsCredits} (ECTS) / ${course.usCredits} (US)',
                                style: new TextStyle(fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.class_, color: course.availabilityColor, size: 24.0,),
                            new Expanded(
                              child: new Text(
                                course.availabilityText,
                                style: new TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                            )
                          ],
                        ),
                      ]
                  ),
                ),
                new GestureDetector(
                  onTap: () {backend.selectCourse(department, course);},
                  child: new Column(
                    children: <Widget>[
                      new Center(
                          child: _isSelected ? new Icon(
                            Icons.favorite,
                            color: Colors.pink,
                            size: 40.0,
                          ) : new Icon(
                            Icons.favorite_border,
                            color: Colors.black12,
                            size: 40.0,
                          )
                      )
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

}

abstract class FavoriteListener {
  void onCourseSelected(Course course);
}