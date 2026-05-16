import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrix/controlllers/admin/bottom_nav_bar_controller.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/images.dart';
import 'package:matrix/views/admin/attendence/select_class_attendence_screen.dart';
import 'package:matrix/views/admin/parents/parents_list.dart';
import 'package:matrix/views/admin/students/student_admin.dart';
import 'package:matrix/views/admin/teachers/teachers_admin.dart';
import 'package:matrix/views/authentications/signup_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final BottomNavController navController =
      Get.isRegistered<BottomNavController>()
      ? Get.find<BottomNavController>()
      : Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240.w,
      backgroundColor: whiteColor,
      child: Column(
        children: [
          /// 🔷 HEADER
          Container(
            width: double.infinity,
            height: 180.h,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
            colors: [primaryColor, blueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "MATRIX",
                  style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                Image.asset(applogo, width: 100.w),
              ],
            ),
          ),

          /// 🔷 MENU ITEMS (TOP)
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                drawerItem(
                  title: "Teachers",
                  icon: Icons.school,
                  onTap: () {
                    navController.changeTab(0); // go to tab 0
                    Get.back();
                  },
                ),

                drawerItem(
                  title: "Students",
                  icon: Icons.assessment,
                  onTap: () {
                   navController.changeTab(2); // go to tab 0
                    Get.back();
                  },
                ),
                drawerItem(
                  title: "Parents",
                  icon: Icons.group_add,
                  onTap: () {
                    Get.to(ParentsList());
                  },
                ),
                drawerItem(
                  title: "Attendence",
                  icon: Icons.calendar_month,
                  onTap: () {
                    Get.to(SelectClassAttendenceScreen());
                  },
                ),
              ],
            ),
          ),

          Divider(color: secondaryColor),

          /// 🔻 LOGOUT (BOTTOM)
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text("Logout"),
              onTap: () {
                Get.to(SignupScreen());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        leading: Icon(icon, color: primaryColor),
        title: Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.w, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
