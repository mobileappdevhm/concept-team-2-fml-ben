import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/widgets/departmentTile.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/pages/homePage.dart';

class DepartmentsFragment extends StatelessWidget {

  final List<Department> departments;
  final SelectionListener listener;

  DepartmentsFragment(this.departments, this.listener);

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
        crossAxisCount: 2,
        children: departments.map((department) {
          return new Padding(
            padding: new EdgeInsets.only(
                left: 4.0,
                right: 4.0,
                top: 4.0
            ),
            child: new DepartmentTile(
                department, listener
            ),
          );
        }).toList()
    );
  }

}