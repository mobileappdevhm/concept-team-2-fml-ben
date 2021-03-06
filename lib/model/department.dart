import 'dart:ui';
import 'course.dart';

class Department {

  final String shortName; // eg FK 07
  final String name; // eg Department 07
  final String fullName; //eg Department of Computer Science and Mathematics
  final Color color;
  final String location; // eg Campus Lothstraße
  final String imageAsset;
  final List<Course> courses;

  Department(this.shortName, this.name, this.fullName, this.color,
      this.location, this.imageAsset, {this.courses = const []});

  get numberOfCourses {
    return courses.length;
  }
}