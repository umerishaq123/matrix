import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/images.dart';
import 'package:matrix/core/widgets/custom_search_bar.dart';
import 'package:matrix/models/admin/parents_model.dart';

class ParentsList extends StatefulWidget {
  const ParentsList({super.key});

  @override
  State<ParentsList> createState() => _ParentsListState();
}

class _ParentsListState extends State<ParentsList> {
  TextEditingController searchController = TextEditingController();

  List<ParentsModel> parentsList = [
    ParentsModel(
      className: "10",
      parentName: "Muhammad Ishaq",
      section: "Aster",
      studnetName: "Umer",
    ),
    ParentsModel(
      className: "08",
      parentName: "Imran Khan",
      section: "Iris",
      studnetName: "Qasim",
    ),
    ParentsModel(
      className: "09",
      parentName: "Nawaz Sharif",
      section: "Daisy",
      studnetName: "Maryam Nawaz",
    ),
    ParentsModel(
      className: "11",
      parentName: "Zardari",
      section: "Jasmine",
      studnetName: "Bilawal Bhutto",
    ),
  ];

  List<ParentsModel> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = parentsList;
  }

  void searchParents(String query) {
    final result = parentsList.where((parent) {
      final name = parent.parentName.toLowerCase();
      final student = parent.studnetName.toLowerCase();
      final input = query.toLowerCase();

      return name.contains(input) || student.contains(input);
    }).toList();

    setState(() {
      filteredList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 10.h),

          /// SEARCH BAR
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: CustomSearchBar(
              controller: searchController,
              hintText: "Search Parents",
              onChanged: searchParents,
              onClear: () {
                searchController.clear();
                searchParents("");
              },
            ),
          ),

          SizedBox(height: 10.h),

          /// LIST VIEW (FIXED)
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final data = filteredList[index];
                return sectionWidget(data);
              },
            ),
          ),
        ],
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
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back,color: whiteColor,)),
          /// TITLE ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Parents',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFD166), Color(0xFFFF6B6B)],
                  ),
                ),
                child: Image.asset(applogo),
              ),
            ],
          ),

          const SizedBox(height: 6),

          const Text(
            'Pakistan International Public School',
            style: TextStyle(color: Color(0xAAFFFFFF), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget sectionWidget(ParentsModel data) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 2.w,
          color: lightGreenColor.withOpacity(0.6),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          children: [
            /// AVATAR
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Center(
                child: Text(
                  data.parentName.length >= 2
                      ? data.parentName.substring(0, 2).toUpperCase()
                      : data.parentName.toUpperCase(),
                  style: GoogleFonts.plusJakartaSans(
                    color: lightGreenColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            SizedBox(width: 10.w),

            /// CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.parentName,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    "Student: ${data.studnetName}",
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: greyColor.withOpacity(0.7),
                    ),
                  ),

                  SizedBox(height: 2.h),

                  Row(
                    children: [
                      Text(
                        "Grade: ${data.className}",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: greyColor.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Section: ${data.section}",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: greyColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}