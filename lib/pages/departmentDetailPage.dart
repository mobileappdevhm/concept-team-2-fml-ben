import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/model/course.dart';
import 'package:demo_muas_sliding/widgets/courseCard.dart';
import 'package:demo_muas_sliding/pages/homePage.dart';

class DepartmentDetailPage extends StatefulWidget {

  final Department department;
  final SelectionListener listener;

  DepartmentDetailPage(this.department, this.listener);

  @override
  _DepartmentDetailPageState createState() => new _DepartmentDetailPageState();

}

class _DepartmentDetailPageState extends State<DepartmentDetailPage> implements FavoriteListener {

  List<Course> _selectedCourses = [];

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
            bool isSelected = _selectedCourses.contains(course);
            return new CourseCard(course, listener: this, isSelected: isSelected,);
          },
          itemCount: widget.department.numberOfCourses,
        ),
      ),
    );
  }

  @override
  void onCourseSelected(Course course) {
    setState(() {
      if (_selectedCourses.contains(course)) {
        _selectedCourses.remove(course);
      }
      else {
        _selectedCourses.add(course);
      }
    });
    widget.listener.select(widget.department, course);
  }

}