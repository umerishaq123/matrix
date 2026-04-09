import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matrix/controlllers/admin/bottom_nav_bar_controller.dart';
import 'package:matrix/core/constants/colors.dart';

class AppDashboard extends StatelessWidget {
  AppDashboard({super.key});

  final BottomNavController controller = Get.put(BottomNavController());
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Obx(
        () => PageStorage(
          bucket: bucket,
          child: controller.screens[controller.currentIndex.value],
        ),
      ),

      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: MediaQuery.of(context).size.width / 50,
                color: whiteColor,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Container(
            decoration: ShapeDecoration(
              color: primaryColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: MediaQuery.of(context).size.width / 80,
                  color: lightGreenColor,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child:Obx(() => FloatingActionButton(
      backgroundColor: blueColor,
      shape: const CircleBorder(),
      child: Icon(
        Icons.dashboard,
        color: controller.currentIndex.value == 2
            ? lightGreenColor // When index 2 is selected
            : secondaryColor, // Otherwise
      ),
      onPressed: () {
        controller.changeTab(2);
      },
))
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height / 11.5,
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// LEFT SIDE
            Row(
              children: [
                navItem(
                  context,
                  icon: Icons.school,
                  // iconPath: AppConstantsIconPath.jobIconPath,
                  label: "Teacher",
                  index: 0,
                  onTap: () {
                    controller.changeTab(0);
                  },
                ),
                navItem(
                  context,
                  icon: Icons.assignment_add,
                  label: "Students",
                  index: 1,
                  onTap: () {
                    controller.changeTab(1);
                  },
                ),
                SizedBox(width: 2,)
              ],
            ),

            /// RIGHT SIDE
            Row(
            
              children: [
               
                navItem(
                  context,
                   icon: Icons.menu_book,
                  label: "Academics",
                  index: 3,
                  onTap: () {
                    controller.changeTab(3);
                  },
                ),
                navItem(
                  context,
                  icon: Icons.person,
                  label: "Profile",
                  index: 4,
                  onTap: () {
                    controller.changeTab(4);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable Navigation Item
  Widget navItem(
    BuildContext context, {
    String? iconPath,
    IconData? icon,
    required String label,
    required int index,
    required VoidCallback onTap,
  }) {
    return Obx(() {
      bool isSelected = controller.currentIndex.value == index;

      return MaterialButton(
        minWidth: 30,
        onPressed: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? lightGreenColor : secondaryColor,
            ),

            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? lightGreenColor : secondaryColor,
              ),
            ),
          ],
        ),
      );
    });
  }
}
