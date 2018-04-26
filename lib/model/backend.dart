import 'dart:collection';
import 'package:demo_muas_sliding/model/course.dart';
import 'package:demo_muas_sliding/model/department.dart';
import 'package:flutter/material.dart';

List<Department> departments = [
  new Department(
      'FK 01',
      'Department 01',
      'Department of Architecture',
      Colors.indigo,
      'Campus Karlstraße',
      'assets/fk1.png'
  ),
  new Department(
      'FK 02',
      'Department 02',
      'Department of Civil Engineering',
      Colors.cyan,
      'Campus Karlstraße',
      'assets/fk2.png'
  ),
  new Department(
      'FK 03',
      'Department 03',
      'Department of Mechanical, Automotive and Aeronautical Engineering',
      Colors.blue,
      'Campus Lothstraße',
      'assets/fk3.png'
  ),
  new Department(
      'FK 04',
      'Department 04',
      'Department of Electrical Engineering and Information Technology',
      Colors.cyan,
      'Campus Lothstraße',
      'assets/fk4.png'
  ),
  new Department(
      'FK 05',
      'Department 05',
      'Department of Building Services Engineering, Chemical Engineering for Paper and Packaging, Print and Media Technologies',
      Colors.indigo,
      'Campus Lothstraße',
      'assets/fk5.png'
  ),
  new Department(
      'FK 06',
      'Department 06',
      'Department of Applied Sciences and Mechatronics',
      Colors.indigo,
      'Campus Lothstraße',
      'assets/fk6.png'
  ),
  new Department(
      'FK 07',
      'Department 07',
      'Department of Computer Science and Mathematics',
      Colors.teal,
      'Campus Lothstraße',
      'assets/fk7.png'
  ),
  new Department(
      'FK 08',
      'Department 08',
      'Department of Geoinformations',
      Colors.cyan,
      'Campus Karlstraße',
      'assets/fk8.png'
  ),
  new Department(
      'FK 09',
      'Department 09',
      'Department of Engineering and Management',
      Colors.lightGreen,
      'Campus Lothstraße',
      'assets/fk9.png'
  ),
  new Department(
      'FK 10',
      'Department 10',
      'Department of Business Administration',
      Colors.green,
      'Campus Pasing',
      'assets/fk10.png'
  ),
  new Department(
      'FK 11',
      'Department 11',
      'Department of Applied Social Sciences',
      Colors.orange,
      'Campus Pasing',
      'assets/fk11.png'
  ),
  new Department(
      'FK 13',
      'Department 13',
      'Department of General and Interdisciplinary Studies',
      Colors.purple,
      'Campus Lothstraße',
      'assets/fk13.png'
  ),
];

class Backend {

  static final Backend _instance = new Backend._newInstance();

  Map<Department, List<Course>> _selection = new HashMap();
  List<BackendListener> listeners = [];

  Backend._newInstance() {
    departments.forEach((department) => _selection.putIfAbsent(department, () => []));
  }

  factory Backend() {
    return _instance;
  }

  List<Department> get allDepartments {
    return _selection.keys.toList();
  }

  List<Course> get availableCourses {
    List<Course> allCourses = [];
    allDepartments.forEach((department) => allCourses.addAll(department.courses));
    return allCourses;
  }

  List<Course> allSelectedCoursesByDepartment(Department department) {
    return _selection[department];
  }

  List<Course> get allSelectedCourses {
    List<Course> allSelectedCourses = [];
    allDepartments
        .forEach((department) => allSelectedCourses.addAll(_selection[department]));
    return allSelectedCourses;
  }

  void _notifyListeners() {
    listeners.forEach((listener) => listener.onDataChanged(this));
  }

  void selectCourse(Department department, Course course) {
    if (_selection[department].contains(course)) {
      _selection[department].remove(course);
    } else {
      _selection[department].add(course);
    }
    _notifyListeners();
  }
}

abstract class BackendListener {
  void onDataChanged(Backend data);
}