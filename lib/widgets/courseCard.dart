import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/model/course.dart';

class CourseCard extends StatelessWidget {

  final Course course;
  final FavoriteListener listener;
  final bool isSelected;

  CourseCard(this.course, {this.listener, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return new MaterialButton(
      padding: new EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0, bottom: 4.0),
      onPressed: () {listener.onCourseSelected(course);},
      child: new Card(
        child: new Padding(
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
                              child: new Text(course.lecturer),
                            )
                          ],
                        ),
                        new Row(
                          children: <Widget>[
                            new Text('Credit Points: ', style: new TextStyle(fontWeight: FontWeight.bold),),
                            new Padding(
                              padding: new EdgeInsets.only(left: 4.0),
                              child: new Text('${course.ectsCredits} (ECTS) / ${course.usCredits} (US)'),
                            )
                          ],
                        ),
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.class_, color: course.availabilityColor, size: 24.0,),
                            new Expanded(
                              child: new Text(course.availabilityText, style: new TextStyle(fontStyle: FontStyle.italic),),
                            )
                          ],
                        ),
                      ]
                  ),
                ),
                new Column(
                  children: <Widget>[
                    new Center(
                      child: isSelected ? new Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 32.0,
                      ) : new Icon(
                        Icons.favorite_border,
                        color: Colors.black12,
                        size: 32.0,
                      )
                    )
                  ],
                ),
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