import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/models/admin/parents_model.dart';
import 'package:matrix/models/parents_model.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ParentsModelN parentData = ParentsModelN(
    parentName: 'Muhammad Abc',
    numChildren: 1,
    gender: 'Female',
    email: 'Syedhumnanaqvi@gmail.com',
    studentClass: '12',
    section: 'Aster',
    studentName: 'Syeda Humna Naqvi',
    rollNumber: '7387',
    admissionNumber: 'f-AUST-7387',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildHeader(),
                Positioned(
                  bottom: -30,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 40.r,
                      child: CircleAvatar(
                        backgroundColor: blackColor,
                        radius: 37.r,
                        child: const Icon(
                          Icons.person_2,
                          size: 30,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.h),
        
            Center(
              child: Text(
                parentData.parentName,
                style: GoogleFonts.poppins(
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
        
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shield_outlined, color: blueColor1),
                SizedBox(width: 1.w),
                Text(
                  "Parent",
                  style: GoogleFonts.poppins(
                    color: blueColor1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  _buildCard("1", "Children"),
                  _buildCard("10th", "Class"),
                  _buildCard("Aster", "Section"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    "Parent Info",
                    style: GoogleFonts.poppins(
                      color: greyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20.r),
        
                      border: Border.all(color: greyColor.withOpacity(0.5)),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGreyColor,
                            ),
                            child: Icon(
                              Icons.person,
                              size: 20,
                              color: blueColor1,
                            ),
                          ),
                          title: Text(
                            "Full Name",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          subtitle: Text(
                            parentData.parentName,
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Divider(color: lightGreyColor),
                        ListTile(
                          leading: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGreyColor,
                            ),
                            child: Icon(
                              Icons.female,
                              size: 25,
                              color: blueColor1,
                            ),
                          ),
                          title: Text(
                            "Gender",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          subtitle: Text(
                            parentData.gender,
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Divider(color: lightGreyColor),
                        ListTile(
                          leading: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGreyColor,
                            ),
                            child: Icon(Icons.email, size: 20, color: blueColor1),
                          ),
                          title: Text(
                            "Email",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          subtitle: Text(
                            parentData.email,
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
        
                  SizedBox(height: 10.h),
                  Text(
                    "Child Info",
                    style: GoogleFonts.poppins(
                      color: greyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20.r),
        
                      border: Border.all(color: greyColor.withOpacity(0.5)),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGreyColor,
                            ),
                            child: Icon(
                              Icons.person,
                              size: 20,
                              color: blueColor1,
                            ),
                          ),
                          title: Text(
                            "Student Name",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          subtitle: Text(
                            parentData.studentName,
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Divider(color: lightGreyColor),
                        ListTile(
                          leading: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGreyColor,
                            ),
                            child: Icon(
                              Icons.female,
                              size: 25,
                              color: blueColor1,
                            ),
                          ),
                          title: Text(
                            "Gender",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          subtitle: Text(
                            parentData.gender,
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Divider(color: lightGreyColor),
                        ListTile(
                          leading: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGreyColor,
                            ),
                            child: Icon(Icons.document_scanner,size: 20, color: blueColor1),
                          ),
                          title: Text(
                            "Roll Number",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          subtitle: Text(
                            parentData.rollNumber,
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                    
                      Divider(color: lightGreyColor),
                        ListTile(
                          leading: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGreyColor,
                            ),
                            child: Icon(Icons.tag, size: 20, color: blueColor1),
                          ),
                          title: Text(
                            "Admission Number",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          subtitle: Text(
                            parentData.admissionNumber,
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                     Divider(color: lightGreyColor),
                        ListTile(
                          leading: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGreyColor,
                            ),
                            child: Icon(Icons.grade, size: 20, color: blueColor1),
                          ),
                          title: Text(
                            "Class&Section",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          subtitle: Text(
                            "${parentData.studentClass}th-${parentData.section}",
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                    
                    
                    
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryColor, blueColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),

      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 20,
        right: 20,
        bottom: 22,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              /// TITLE
              const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),

              /// LOGO
              Container(
                width: 40,
                height: 40,

                decoration: const BoxDecoration(
                  shape: BoxShape.circle,

                  gradient: LinearGradient(
                    colors: [Color(0xFFFFD166), Color(0xFFFF6B6B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: const Center(
                  child: Text(
                    'PIPS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          /// SUBTITLE
          // const Text(
          //   'Grade 12--Syeda Humna Naqvi',
          //   style: TextStyle(color: whiteColor, fontSize: 12),
          // ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String subtitle) {
    return Container(
      height: 60.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.r),

        border: Border.all(color: greyColor.withOpacity(0.5)),
      ),

      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: blueColor1,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              color: kTextMuted,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
