import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/widgets/departmentTile.dart';
import 'package:demo_muas_sliding/widgets/searchWidget.dart';
import 'package:demo_muas_sliding/model/backend.dart';
import 'package:demo_muas_sliding/widgets/courseCard.dart';

class DepartmentsFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new SearchWidget(
        new GridView.count(
            crossAxisCount: 2,
            children: new Backend().allDepartments.map((department) {
              return new Padding(
                padding: new EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                    top: 4.0
                ),
                child: new DepartmentTile(
                    department
                ),
              );
            }).toList()
        ),
        onResult: (searchText) {
          List<Widget> resultItems = [];
          new Backend().allDepartments.forEach((department) {
            department.courses
                .where((course) => course.name.toLowerCase().contains(searchText.toLowerCase()))
                .forEach((course) => resultItems.add(new CourseCard(department, course)));
          });
          return resultItems;
        },
    );
  }

}