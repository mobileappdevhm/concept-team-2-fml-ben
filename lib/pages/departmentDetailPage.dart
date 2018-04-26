import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/model/course.dart';
import 'package:demo_muas_sliding/widgets/courseCard.dart';
import 'package:demo_muas_sliding/model/backend.dart';

class DepartmentDetailPage extends StatefulWidget {

  final Department department;

  DepartmentDetailPage(this.department);

  @override
  _DepartmentDetailPageState createState() => new _DepartmentDetailPageState();

}

class _DepartmentDetailPageState extends State<DepartmentDetailPage> implements BackendListener {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: widget.department.color,
        title: new Text(widget.department.name),
      ),
      body: new Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            Course course = widget.department.courses[index];
            return new CourseCard(widget.department, course);
          },
          itemCount: widget.department.numberOfCourses,
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
  void initState() {
    new Backend().addListener(this);
  }

}