import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:demo_muas_sliding/dialogs/departmentDialog.dart';

class DepartmentTile extends StatelessWidget {

  final Department department;

  DepartmentTile(this.department);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new MaterialButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => new DepartmentDialog(department)
          );
        },
        color: department.color,
        padding: new EdgeInsets.all(0.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
                child: new Padding(
                  padding: new EdgeInsets.all(16.0),
                  child: new Image.asset(department.imageAsset),
                )
            ),
            new Material(
              color: Colors.grey,
              child: new Center(
                child: new Text(department.shortName,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 24.0
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

}