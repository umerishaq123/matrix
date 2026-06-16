import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:matrix/views/admin/academics.dart';
import 'package:matrix/views/admin/home/home_screen.dart';

import 'package:matrix/views/admin/students/student_admin.dart';
import 'package:matrix/views/admin/teachers/teachers_admin.dart';
import 'package:matrix/views/parents/parents_accademic_section/Accadamic_parents.dart';
import 'package:matrix/views/parents/parents_home_dashboard/parents_dashboard.dart';
import 'package:matrix/views/parents/profile_parent/profile.dart';
import 'package:matrix/views/teacher/accademic/accademic_screen.dart';
import 'package:matrix/views/teacher/students_teacher/student_teacher_classes_section.dart';
import 'package:matrix/views/teacher/teacher_dashboard/teacher_dashboard_screen.dart';

class BottomNavControllerParents extends GetxController {
  var currentIndex = 1.obs;

  final List<Widget> screens = [
    AccadamicParents(),

    ParentsDashbaord(),
    Profile(),

    //
  ];

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
