import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:matrix/core/constants/app_sizes.dart';
import 'package:matrix/core/constants/attendence_anum.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/student_attendence_type_enum.dart';
import 'package:matrix/models/admin/attendence_model.dart';
import 'package:matrix/views/admin/attendence/attendence_view_screen.dart';

class ChooseSection extends StatefulWidget {
  final String className;
  ChooseSection({super.key, required this.className});

  @override
  State<ChooseSection> createState() => _ChooseSectionState();
}

class _ChooseSectionState extends State<ChooseSection> {
  String formattedDate = DateFormat('EEE d MMMM yyyy').format(DateTime.now());
  List<String> classesList = ["IRIS", "DAISY", "JASMINE", "ASTER"];

  List<AttendanceModel> studentData = [
    AttendanceModel(
      className: "08",
      noStudent: 34,
      studentAttendance: StudentAttendance(
        name: "umer ishaq",
        rollNo: 1,
        isPresent: AttendenceTpe.present,
        date: DateTime.now(),
      ),
      section: 'IRIS',
    ),
    AttendanceModel(
      className: "08",
      noStudent: 34,
      studentAttendance: StudentAttendance(
        name: "qasi",
        rollNo: 02,
        isPresent: AttendenceTpe.absent,
        date: DateTime.now(),
      ),
      section: 'IRIS',
    ),
    AttendanceModel(
      className: "08",
      noStudent: 34,
      studentAttendance: StudentAttendance(
        name: "Syeda humna naqvi",
        rollNo: 03,
        isPresent: AttendenceTpe.leave,
        date: DateTime.now(),
      ),
      section: 'IRIS',
    ),
    AttendanceModel(
      className: "10",
      noStudent: 34,
      studentAttendance: StudentAttendance(
        name: "Maryam",
        rollNo: 01,
        isPresent: AttendenceTpe.leave,
        date: DateTime.now(),
      ),
      section: 'DAISY',
    ),
  ];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _buildHeader(),
            SizedBox(height: AppSize.medium(context)),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Select a Section",
                style: GoogleFonts.poppins(
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Sections",
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ...classesList.asMap().entries.map((entry) {
                    int index = entry.key;
                    final sectionName = entry.value;

                    final sAttendenceData = studentData.where((item) {
                      return item.section == sectionName &&
                          item.className == widget.className;
                    }).toList();

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: sectionWidget(
                        sectionName,

                        "32",
                        () {
                          Get.to(
                            AttendenceViewScreen(
                              classData: {
                                "className": widget.className,
                                "sectionName": sectionName,
                              },
                              studentAttence: sAttendenceData,
                            ),
                          );
                          setState(() {
                            selectedIndex = index; // 👈 update selection
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
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, color: whiteColor),
              ),
              SizedBox(width: 70.w),
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
          Text(
            'Attendence ${widget.className}',
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
          const SizedBox(height: 4),
          Text(
            'Choose a Section to mark/view',
            style: TextStyle(
              color: secondaryColor.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionWidget(
    String sectionName,
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
          color: whiteColor,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.5.w, color: lightGreenColor),
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
                  color: greyColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Center(
                  child: Text(
                    sectionName.length >= 2
                        ? sectionName.substring(0, 2).toUpperCase()
                        : sectionName.toUpperCase(),
                    style: GoogleFonts.plusJakartaSans(
                      color: lightGreenColor,
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
                      " $sectionName",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "$students Students",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: greyColor.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  GestureDetector(
                    onTap: ontap,
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w), // spacing
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: greyColor.withOpacity(0.1),
                        border: Border.all(
                          width: 1.5.w,
                          color: lightGreenColor,
                        ),
                      ),
                      child: Text(
                        "view",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
