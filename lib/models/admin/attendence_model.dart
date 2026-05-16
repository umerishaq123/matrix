import 'package:matrix/core/constants/student_attendence_type_enum.dart';

class AttendanceModel {
  String className;
  String section;
  int noStudent;
  StudentAttendance studentAttendance;

  AttendanceModel({
    required this.section,
    required this.className,
    required this.noStudent,
    required this.studentAttendance,
  });
}

class StudentAttendance {
  String name;
  int rollNo;
  DateTime date;
  AttendenceTpe isPresent;

  StudentAttendance({
    required this.name,
    required this.rollNo,
    required this.isPresent,
    required this.date,
  });
}
