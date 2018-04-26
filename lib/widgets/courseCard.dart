import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/model/backend.dart';
import 'package:demo_muas_sliding/model/course.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/dialogs/courseDialog.dart';

class CourseCard extends StatefulWidget {

  final Department department;
  final Course course;
  final Backend backend = new Backend();

  CourseCard(this.department, this.course);

  @override
  State<StatefulWidget> createState() => new _CourseCardState();

}

class _CourseCardState extends State<CourseCard> implements BackendListener {

  bool get _isSelected {
    return widget.backend.isCourseSelected(widget.department, widget.course);
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
                  builder: (context) => new CourseDialog(widget.department, widget.course)
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
                          widget.course.name,
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
                                widget.course.lecturer,
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
                                '${widget.course.ectsCredits} (ECTS) / ${widget.course.usCredits} (US)',
                                style: new TextStyle(fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.class_, color: widget.course.availabilityColor, size: 24.0,),
                            new Expanded(
                              child: new Text(
                                widget.course.availabilityText,
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
                  onTap: () {widget.backend.selectCourse(widget.department, widget.course);},
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

  @override
  void onDataChanged(Backend data) {
    setState(() {

    });
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
}

abstract class FavoriteListener {
  void onCourseSelected(Course course);
}