import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrix/core/constants/app_sizes.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/models/admin/annoucement_model.dart';
import 'package:matrix/models/admin/overall_model.dart';
import 'package:matrix/models/admin/parents_meatings_model.dart';
import 'package:matrix/views/admin/add_annoucement_screen.dart';
import 'package:matrix/views/admin/home/add_date_sheat_timetable.dart';
import 'package:matrix/views/student/create_student.dart';
import 'package:matrix/views/teacher/create_teacher.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, OverallModel> overalldata = {
    "overalldata": OverallModel(726, 55, 500),
  };

  List<ParentsMeatingsModel> parentsMeetingList = [
    ParentsMeatingsModel(
      "12",
      "MAR",
      "10 am",
      "Annual parents meeting",
      "Hall one",
    ),
    ParentsMeatingsModel(
      "15",
      "JUN",
      "11 am",
      "Mid Term parents meeting",
      "Room no 1",
    ),
    ParentsMeatingsModel(
      "19",
      "AUG",
      "2 am",
      " parents meeting",
      "Adjecent to pricipal office",
    ),
  ];

  List<AnnoucementModel> annoucementlist = [
    AnnoucementModel(
      "tomorrow",
      "Mid-term exams will begin from next Monday,Mid-term exams will begin from next Monday,Mid-term exams will begin from next Monday",
      "Mid Term Exam",
    ),
    AnnoucementModel(
      "15 feb",
      "Student week is started from next monday",
      "Strudent week",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.mediumPadding(context),
            vertical: AppSize.extraLargePadding(context),
          ),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .start,
                    mainAxisSize: .min,
                    children: [
                      Text(
                        "Good Morning 👋",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        "Dashboard",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: blackColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: blackColor.withOpacity(0.6)),
                    ),
                    child: Icon(
                      Icons.notifications_active,
                      color: blackColor,
                      size: AppSize.iconSizeMedium(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                "Quick Actions",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(CreateTeacher());
                      },
                      child: quickActionWidget(Icons.school, "Add Teacher")),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(CreateStudent());
                      },
                      child: quickActionWidget(Icons.person, "Add Student")),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(AddAnnoucementScreen());
                      },
                      child: quickActionWidget(Icons.campaign, "Add Annoucement")),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(AddDateSheatTimeTableScreen());
                      },
                      child: quickActionWidget(
                        Icons.calendar_month_outlined,
                        "Add date sheat/Time Table",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),

              Text(
                "Overall Data",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  overallDataWidget(
                    Icon(Icons.school, color: secondaryColor),
                    overalldata["overalldata"]!.teachers.toString(),
                    "Teachers",
                  ),
                  overallDataWidget(
                    Icon(Icons.group, color: secondaryColor),
                    overalldata["overalldata"]!.students.toString(),
                    "Students",
                  ),

                  overallDataWidget(
                    Icon(Icons.family_restroom, color: secondaryColor),
                    overalldata["overalldata"]!.parents.toString(),
                    "Parents",
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Overall attendence",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    "View All",
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: blueColor1,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              attendanceWidget(
                percentage: 84.0,
                totalClasses: 120,
                attendedClasses: 101,
                subject: "Computer Science",
                requiredPercentage: 75.0,
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Upcomming Parents meetings",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    "View All",
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: blueColor1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: parentsMeetingList.length,
                itemBuilder: (context, index) {
                  final data = parentsMeetingList[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: parentsMeetingsWidget(data, context),
                  );
                },
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Latest Annoucements",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    "View All",
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: blueColor1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: annoucementlist.length,
                itemBuilder: (context, index) {
                  final data = annoucementlist[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: annoucementWidget(data),
                  );
                },
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget overallDataWidget(Icon icon, String count, String title) {
    return Container(
      height: 110.h,
      width: 100,
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.smallPadding(context),
        vertical: AppSize.smallPadding(context),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [blueColor, primaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: blackColor.withOpacity(0.6)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Column content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: blackColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: lightGreenColor),
                ),
                child: icon,
              ),

              SizedBox(height: 10.h),
              Text(
                count,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400,
                ),
              ),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: secondaryColor,
                ),
              ),
            ],
          ),

          // Top-right decorative element
          Positioned(
            top: -10,
            right: -10,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: secondaryColor, // Accent color
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.star, // Example icon
                  color: whiteColor,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget attendanceWidget({
    required double percentage,
    required int totalClasses,
    required int attendedClasses,
    String subject = "Overall Attendance",
    double requiredPercentage = 75.0,
  }) {
    final int missedClasses = totalClasses - attendedClasses;
    final bool isSafe = percentage >= requiredPercentage;
    final int classesCanMiss = isSafe
        ? ((attendedClasses - (requiredPercentage / 100) * totalClasses) /
                  (1 - requiredPercentage / 100))
              .floor()
        : 0;
    final int classesNeeded = !isSafe
        ? ((requiredPercentage * totalClasses / 100) - attendedClasses).ceil()
        : 0;

    final IconData statusIcon = percentage >= 90
        ? Icons.workspace_premium_rounded
        : percentage >= requiredPercentage
        ? Icons.check_circle_rounded
        : Icons.warning_amber_rounded;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, blueColor],
          stops: [0.2, 1.0], // 80% primaryColor, 20% blueColor
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: primaryColor.withOpacity(0.15), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header Row ──────────────────────────────────────────
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: blueColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(statusIcon, color: whiteColor, size: 14),
                    const SizedBox(width: 5),
                    Text(
                      "overall attendence",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: whiteColor,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Icon(
                Icons.calendar_today_rounded,
                size: 14,
                color: Colors.grey.shade400,
              ),
              const SizedBox(width: 4),
              Text(
                "This Semester",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          // ── Circular + Stats Row ────────────────────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular indicator
              CircularPercentIndicator(
                radius: 62.0,
                lineWidth: 11.0,
                percent: (percentage / 100).clamp(0.0, 1.0),
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${percentage.toStringAsFixed(1)}%",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: lightGreenColor,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      "attended",
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.grey.shade100,
                linearGradient: LinearGradient(
                  colors: [blueColor, lightGreenColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              const SizedBox(width: 20),

              // Stats column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _statRow(
                      icon: Icons.check_rounded,
                      iconColor: const Color(0xFF00C896),
                      bgColor: const Color(0xFFE6FFF8),
                      label: "Attended",
                      value: "$attendedClasses students",
                    ),
                    const SizedBox(height: 8),
                    _statRow(
                      icon: Icons.close_rounded,
                      iconColor: const Color(0xFFEF4444),
                      bgColor: const Color(0xFFFEF2F2),
                      label: "Missed",
                      value: "$missedClasses students",
                    ),
                    const SizedBox(height: 8),
                    _statRow(
                      icon: Icons.layers_rounded,
                      iconColor: const Color(0xFF8B5CF6),
                      bgColor: const Color(0xFFF5F3FF),
                      label: "Total",
                      value: "$totalClasses students",
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ── Progress Bar with required marker ───────────────────
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text(
          //           "Required: ${requiredPercentage.toInt()}%",
          //           style: TextStyle(
          //             fontSize: 11,
          //             color: Colors.grey.shade500,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //         Text(
          //           "Current: ${percentage.toStringAsFixed(1)}%",
          //           style: TextStyle(
          //             fontSize: 11,
          //             color: primaryColor,
          //             fontWeight: FontWeight.w700,
          //           ),
          //         ),
          //       ],
          //     ),
          //     const SizedBox(height: 6),
          //     Stack(
          //       children: [
          //         // Background track
          //         Container(
          //           height: 8,
          //           decoration: BoxDecoration(
          //             color: Colors.grey.shade100,
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //         ),
          //         // Progress fill
          //         FractionallySizedBox(
          //           widthFactor: (percentage / 100).clamp(0.0, 1.0),
          //           child: Container(
          //             height: 8,
          //             decoration: BoxDecoration(
          //               gradient: LinearGradient(
          //                 colors: [primaryColor.withOpacity(0.5), primaryColor],
          //               ),
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //           ),
          //         ),
          //         // Required threshold marker
          //         Positioned(
          //           left:
          //               MediaQuery.of(context).size.width *
          //               (requiredPercentage / 100) *
          //               0.75, // approximate
          //           top: -2,
          //           child: Container(
          //             width: 2,
          //             height: 12,
          //             decoration: BoxDecoration(
          //               color: Colors.orange.shade400,
          //               borderRadius: BorderRadius.circular(2),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),

          // const SizedBox(height: 16),

          // // ── Bottom Info Card ────────────────────────────────────
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          //   decoration: BoxDecoration(
          //     color: isSafe ? const Color(0xFFF0FDF9) : const Color(0xFFFFF7ED),
          //     borderRadius: BorderRadius.circular(14),
          //     border: Border.all(
          //       color: isSafe
          //           ? const Color(0xFF00C896).withOpacity(0.2)
          //           : Colors.orange.shade200,
          //     ),
          //   ),
          //   child: Row(
          //     children: [
          //       Icon(
          //         isSafe
          //             ? Icons.thumb_up_alt_rounded
          //             : Icons.info_outline_rounded,
          //         size: 16,
          //         color: isSafe
          //             ? const Color(0xFF00C896)
          //             : Colors.orange.shade600,
          //       ),
          //       const SizedBox(width: 8),
          //       Expanded(
          //         child: Text(
          //           isSafe
          //               ? "You can miss up to $classesCanMiss more class${classesCanMiss == 1 ? '' : 'es'} and stay above ${requiredPercentage.toInt()}%."
          //               : "Attend $classesNeeded more class${classesNeeded == 1 ? '' : 'es'} to reach the required ${requiredPercentage.toInt()}%.",
          //           style: TextStyle(
          //             fontSize: 12,
          //             fontWeight: FontWeight.w500,
          //             color: isSafe
          //                 ? const Color(0xFF065F46)
          //                 : Colors.orange.shade800,
          //             height: 1.4,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _statRow({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 13, color: iconColor),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget parentsMeetingsWidget(
    ParentsMeatingsModel data,
    BuildContext context,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.04), // responsive padding
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryColor, blueColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: primaryColor.withOpacity(0.15), width: 1.2),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// 📅 Date Box
          Container(
            width: screenWidth * 0.13,
            height: screenWidth * 0.13,
            decoration: BoxDecoration(
              color: blackColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: lightGreenColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.date ?? "",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                    color: blueColor1,
                  ),
                ),

                Text(
                  data.month ?? "",
                  style: TextStyle(
                    fontSize: screenWidth * 0.02,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: screenWidth * 0.04),

          /// 📝 Title & Venue
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  data.venue ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.035,
                    color: secondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: screenWidth * 0.02),

          /// ⏰ Time Badge
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenWidth * 0.015,
            ),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              data.time ?? "",
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget annoucementWidget(AnnoucementModel annoucementdata) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.04), // responsive padding
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryColor, blueColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: primaryColor.withOpacity(0.15), width: 1.2),
      ),

      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "${annoucementdata.title}",
                style: GoogleFonts.poppins(
                  color: whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "View Detail",
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            annoucementdata.description,
            style: GoogleFonts.poppins(
              color: lightGreyColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
            maxLines: 3,
          ),
          SizedBox(height: 10.h),
          Text(
            annoucementdata.date,
            style: GoogleFonts.poppins(
              color: whiteColor.withOpacity(0.4),
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget quickActionWidget([IconData? icon, String? title]) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.04), // responsive padding
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryColor, blueColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: primaryColor.withOpacity(0.15), width: 1.2),
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.10,
            height: screenWidth * 0.10,
            decoration: BoxDecoration(
              color: blackColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: lightGreenColor),
            ),
            child: Icon(icon, color: secondaryColor),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Text(
              title ?? "",
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: secondaryColor,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // adds "..." if still long
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
