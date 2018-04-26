import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/model/course.dart';
import 'package:demo_muas_sliding/widgets/courseCard.dart';
import 'package:demo_muas_sliding/widgets/searchWidget.dart';

class DepartmentDetailPage extends StatelessWidget {

  final Department department;

  DepartmentDetailPage(this.department);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: department.color,
        title: new Text(department.name),
      ),
      body: new SearchWidget(
        new Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              Course course = department.courses[index];
              return new CourseCard(department, course);
            },
            itemCount: department.numberOfCourses,
          ),
        ),
        onResult: (searchString) {
          List<Widget> resultItems = [];
          department.courses
              .where((course) => course.name.toLowerCase().contains(searchString.toLowerCase()))
              .forEach((course) => resultItems.add(new CourseCard(department, course))
          );
          return resultItems;
        },
      )
    );
  }

}