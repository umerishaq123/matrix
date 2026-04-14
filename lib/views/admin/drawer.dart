import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/images.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
            color: primaryColor,
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
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Teachers"),
                  onTap: () {},
                ),
              ],
            ),
          ),

          /// 🔻 LOGOUT (BOTTOM)
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text("Logout"),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}