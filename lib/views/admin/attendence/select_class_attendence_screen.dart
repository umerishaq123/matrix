import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:matrix/core/constants/app_sizes.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/models/admin/attendence_model.dart';
import 'package:matrix/views/admin/attendence/choose_section.dart';

class SelectClassAttendenceScreen extends StatefulWidget {
  const SelectClassAttendenceScreen({super.key});

  @override
  State<SelectClassAttendenceScreen> createState() =>
      _SelectClassAttendenceScreenState();
}

class _SelectClassAttendenceScreenState
    extends State<SelectClassAttendenceScreen> {
  String formattedDate = DateFormat('EEE d MMMM yyyy').format(DateTime.now());
  List<String> classesList = ["08", "09", "10", "11", "12"];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _buildHeader(),
            SizedBox(height: AppSize.medium(context)),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Select a Class",
                style: GoogleFonts.poppins(
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(color: secondaryColor),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Classes",
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ...classesList.asMap().entries.map((entry) {
                    int index = entry.key;
                    var data = entry.value;

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: classesWidget(
                        data,
                        "4",
                        "32",
                        () {
                          
                          print("::: the value of this:${data}");
                          Get.to(ChooseSection( className: data,));
                          setState(() {
                            selectedIndex = index;
                             // 👈 update selection
                          });
                        },
                        selectedIndex == index, // 👈 pass condition
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
         gradient: const LinearGradient(
            colors: [primaryColor, blueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: .spaceEvenly,
            children: [
              IconButton(onPressed: (){
                Get.back();

              }, icon: Icon(Icons.arrow_back,color: whiteColor,)),
              SizedBox(width: 70.w,),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.calendar_month,
                  color: secondaryColor,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Attendence',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            formattedDate,
            style: TextStyle(
              color: secondaryColor.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget classesWidget(
    String className,
    String sections,
    String students,
    VoidCallback ontap,
    bool isselected,
  ) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            width: 1.5.w,
            color: isselected ? blueColor1 : greyColor.withOpacity(0.3),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Row(
            children: [
              // Left Box
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Center(
                  child: Text(
                    className,
                    style: GoogleFonts.plusJakartaSans(
                      color: blueColor1,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10.w),

              // Middle Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Class $className",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "$sections Sections • $students Students",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),

              // Right Arrow
              Icon(Icons.arrow_forward_ios, size: 18.sp, color: greyColor),
            ],
          ),
        ),
      ),
    );
  }
}
