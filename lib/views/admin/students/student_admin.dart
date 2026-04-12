import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/models/admin/student_admin_model.dart';
import 'package:matrix/views/admin/students/widgets/student_section_grid_widget.dart';

class StudentAdmin extends StatefulWidget {
  const StudentAdmin({super.key});

  @override
  State<StudentAdmin> createState() => _StudentAdminState();
}

class _StudentAdminState extends State<StudentAdmin>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<int> _classes = [9, 10, 11, 12];

  final List<StudentAdminModel> studentData = [
    StudentAdminModel(
      name: "malik talha",
      gender: "male",
      className: "9",
      section: "Iris",
      rollNum: "01",
    ),
    StudentAdminModel(
      name: "malik qasim",
      gender: "male",
      className: "10",
      section: "Daisy",
      rollNum: "02",
    ),
    StudentAdminModel(
      name: "Syeda Humna Naqvi",
      gender: "Female",
      className: "11",
      section: "Jasmine",
      rollNum: "12",
    ),
    StudentAdminModel(
      name: "Maryam",
      gender: "Female",
      className: "12",
      section: "Aster",
      rollNum: "13",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _classes.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Column(
        children: [
          _buildHeader(),
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: studentData
                  .map(
                    (cls) => SectionStudentGridPage(
                      classNumber: int.parse(cls.className ?? ''),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryColor, blueColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25.r),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Students',
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
          const SizedBox(height: 2),
          const Text(
            'Pakistan International Public School',
            style: TextStyle(color: Color(0xAAFFFFFF), fontSize: 12),
          ),
          const SizedBox(height: 14),

          // Search bar
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          //   decoration: BoxDecoration(
          //     color: Colors.white.withOpacity(0.15),
          //     borderRadius: BorderRadius.circular(14),
          //   ),
          //   child: const Row(
          //     children: [
          //       Icon(Icons.search, color: Color(0x99FFFFFF), size: 18),
          //       SizedBox(width: 8),
          //       Text(
          //         'Search teachers...',
          //         style: TextStyle(color: Color(0x80FFFFFF), fontSize: 14),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryColor, blueColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: blackColor,
        isScrollable: true,
        padding: EdgeInsets.zero,
        unselectedLabelColor: whiteColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          fontFamily: 'Poppins',
          color: primaryColor,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          fontFamily: 'Poppins',
          color: whiteColor,
        ),
        indicator: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.35),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: _classes.map((c) => Tab(text: 'Class $c')).toList(),
      ),
    );
  }
}
