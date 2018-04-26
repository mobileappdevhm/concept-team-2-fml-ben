import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/widgets/departmentTile.dart';
import 'package:demo_muas_sliding/model/backend.dart';

class DepartmentsFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
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
    );
  }

}