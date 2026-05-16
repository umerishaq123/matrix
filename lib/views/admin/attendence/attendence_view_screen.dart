import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/student_attendence_type_enum.dart';
import 'package:matrix/models/admin/attendence_model.dart';

class AttendenceViewScreen extends StatefulWidget {
  final Map<String, dynamic> classData;
  final List<AttendanceModel> studentAttence;
  const AttendenceViewScreen({
    super.key,
    required this.classData,
    required this.studentAttence,
  });

  @override
  State<AttendenceViewScreen> createState() => _AttendenceViewScreenState();
}

class _AttendenceViewScreenState extends State<AttendenceViewScreen> {
  String formattedDate = DateFormat('EEE d MMMM yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final present = widget.studentAttence.where((presentdata) {
      return presentdata.studentAttendance.isPresent == AttendenceTpe.present;
    }).toList();
    final absent = widget.studentAttence.where((data) {
      return data.studentAttendance.isPresent == AttendenceTpe.absent;
    }).toList();
    final leave = widget.studentAttence.where((data) {
      return data.studentAttendance.isPresent == AttendenceTpe.leave;
    }).toList();
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      _StatCard(
                        value: present.length.toString(),
                        label: "Present",
                      ),
                      SizedBox(width: 5.w),
                      _StatCard(
                        value: absent.length.toString(),
                        label: "Absent",
                      ),
                      SizedBox(width: 5.w),
                      _StatCard(value: leave.length.toString(), label: "Leave"),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Students",
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: greyColor,
                    ),
                  ),

                  if (widget.studentAttence.isEmpty)
                    Expanded(
                      child: Center(
                        child: Text(
                          "No data is Available",
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: greyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: widget.studentAttence.length,
                        itemBuilder: (context, index) {
                          final data =
                              widget.studentAttence[index].studentAttendance;

                          return sectionWidget(data);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
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
            'Attendence ${widget.classData["className"]}-${widget.classData["sectionName"]}',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Column(
            children: [
              Text(
                "Today's attendence",
                style: TextStyle(
                  color: secondaryColor.withOpacity(0.7),
                  fontSize: 13,
                ),
              ),
              Text(
                " ${formattedDate}",
                style: TextStyle(color: secondaryColor, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sectionWidget(StudentAttendance data) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(width: 2.w,   color: data.isPresent == AttendenceTpe.present
                        ? lightGreenColor.withOpacity(0.6)
                        : data.isPresent == AttendenceTpe.absent
                        ? redColor.withOpacity(0.6)
                        : greyColor.withOpacity(0.5),),
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
                  data.name.length >= 2
                      ? data.name.substring(0, 2).toUpperCase()
                      : data.name.toUpperCase(),
                  style: GoogleFonts.plusJakartaSans(
                    color: lightGreenColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
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
                    " ${data.name}",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Roll no:- ${data.rollNo}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: greyColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.w), // spacing
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: data.isPresent == AttendenceTpe.present
                        ? lightGreenColor.withOpacity(0.3)
                        : data.isPresent == AttendenceTpe.absent
                        ? redColor.withOpacity(0.6)
                        : greyColor.withOpacity(0.2),
                    border: Border.all(width: 1.5.w, color: lightGreenColor),
                  ),
                  child: Text(
                    data.isPresent.name,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [primaryColor, blueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: whiteColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
