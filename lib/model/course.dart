import 'package:flutter/material.dart';

class Course {
  final String name;
  final String lecturer;
  final int hoursPerWeek;
  final num ectsCredits;
  final num usCredits;
  final Availability availability;

  Course(this.name, this.lecturer, this.hoursPerWeek, this.ectsCredits,
      this.usCredits, this.availability);

  get availabilityColor {
    switch (availability) {
      case Availability.green:
        return Colors.green;
      case Availability.yellow:
        return Colors.yellow;
      case Availability.red:
        return Colors.red;
    }
  }

  get availabilityText {
    switch (availability) {
      case Availability.green:
        return 'Open to all (exchange) students from all departments';
      case Availability.yellow:
        return 'Open to all (exchange) students, students from the "home" '
            'department will be given priority';
      case Availability.red:
        return 'Only open to students from the "home" department';
    }
  }

}

enum Availability {
  green, yellow, red
}