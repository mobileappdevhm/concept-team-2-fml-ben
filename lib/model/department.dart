import 'dart:ui';
import 'course.dart';

class Department {

  final String shortName; // eg FK 07
  final String name; // eg Department 07
  final String fullName; //eg Department of Computer Science and Mathematics
  final Color color;
  final String location; // eg Campus Lothstraße
  final String imageAsset;
  final List<Course> courses = [
    new Course('Mobile Application Development', 'Socher', 4, 5, 3, Availability.green),
    new Course('Compiler Construction', 'Ruckert', 4, 5, 3, Availability.yellow),
    new Course('Technical Writing in Computer Science', 'Balazs', 4, 5, 3, Availability.red)
  ];

  Department(this.shortName, this.name, this.fullName, this.color,
      this.location, this.imageAsset, /*{this.courses = const []}*/); //TODO Uncomment

  get numberOfCourses {
    return courses.length;
  }
}