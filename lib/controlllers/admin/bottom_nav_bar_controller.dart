import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrix/views/admin/Teachers.dart';
import 'package:matrix/views/admin/academics.dart';
import 'package:matrix/views/admin/home/home_screen.dart';
import 'package:matrix/views/admin/profile.dart';
import 'package:matrix/views/admin/students.dart';


class BottomNavController extends GetxController {

  var currentIndex = 2.obs;

  final List<Widget> screens = [
    Teachers(),
    Students(),
    HomeScreen(),
    Academics(),
    Profile(),
 
  ];

  void changeTab(int index) {
    currentIndex.value = index;
  }
}