import 'dart:collection';
import 'sampleData.dart';
import 'package:demo_muas_sliding/model/course.dart';
import 'package:demo_muas_sliding/model/department.dart';

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
    List<Department> departments = _selection.keys.toList();
    departments.sort((d1, d2) => d1.shortName.compareTo(d2.shortName));
    return departments;
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

  void addListener(BackendListener listener) {
    listeners.add(listener);
  }

  void removeListener(BackendListener listener) {
    listeners.remove(listener);
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

  bool isCourseSelected(Department department, Course course) {
    return _selection[department].contains(course);
  }

  bool hasSelectedCourses(Department department) {
    return _selection[department].isNotEmpty;
  }
}

abstract class BackendListener {
  void onDataChanged(Backend data);
}