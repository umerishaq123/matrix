import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/images.dart';
import 'package:matrix/views/parents/parents_accademic_section/pdf_viewer_screen_assignment.dart';
import 'package:matrix/views/parents/parents_accademic_section/pdf_viewer_screen_notes.dart';

class AccadamicParents extends StatefulWidget {
  const AccadamicParents({super.key});

  @override
  State<AccadamicParents> createState() => _AccadamicParentsState();
}

class _AccadamicParentsState extends State<AccadamicParents>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedTabIndex = 0;

  /// Dummy Notes Data
  final List<Map<String, dynamic>> notesList = [
    {
      "class": "10th",
      "section": "Aster",
      "title": "Chapter 1 Algebra Notes",
      "subject": "Mathematics",
      "date": "14 May 2026",
      "teacher": "Amir jamal",
      "notesPdf": physicsPdf
    },
    {
      "class": "9th",
      "section": "Aster",
      "title": "Physics Motion Notes",
      "subject": "Physics",
      "date": "12 May 2026",
      "teacher": "Fahad",
       "notesPdf": physicsPdf
    },
    {
      "class": "11th",
      "section": "Jasmine",
      "title": "English Grammar Notes",
      "subject": "English",
      "date": "10 May 2026",
      "teacher": "kinza Tabassam",
       "notesPdf": englishPdf
    },
  ];

  /// Dummy Assignment Data
  final List<Map<String, dynamic>> assignmentList = [
    {
      "class": "9th",
      "section": "Aster",
      "title": "Algebra Homework",
      "subject": "Mathematics",
      "deadline": "20 May 2026",
      "assignmentPdf": aljebraAssignmentPdf
    },
    {
      "class": "10th",
      "section": "Jasmine",
      "title": "Physics Numerical",
      "subject": "Physics",
      "deadline": "18 May 2026",
      "assignmentPdf":physicsAssingmentPdf
    },
    {
      "class": "9th",
      "section": "Aster",
      "title": "Essay Writing",
      "subject": "English",
      "deadline": "22 May 2026",
      "assignmentPdf":essayWrititngAssingmentPdf
    },
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 14.h),

          /// TABS
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),

            child: Container(
              height: 50.h,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14.r),
              ),

              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                onTap: (index) {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  gradient: const LinearGradient(
                    colors: [primaryColor, blueColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                labelColor: whiteColor,
                unselectedLabelColor: Colors.black87,

                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Tab(text: "Notes"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Tab(text: "Assignments"),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 15.h),

          /// TAB VIEW
          Expanded(
            child: TabBarView(
              controller: _tabController,

              children: [
                /// NOTES TAB
                _buildNotesTab(),

                /// ASSIGNMENTS TAB
                _buildAssignmentTab(),
              ],
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
                'Academic',
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
          const Text(
            'Grade 12--Syeda Humna Naqvi',
            style: TextStyle(color: whiteColor, fontSize: 12),
          ),
        ],
      ),
    );
  }



  /// NOTES TAB
  Widget _buildNotesTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// FILTER TABS
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "Recent Notes",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: kTextMuted,
            ),
          ),
        ),
        SizedBox(height: 10.h),

        /// LIST
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),

            itemCount: notesList.length,

            itemBuilder: (context, index) {
              final note = notesList[index];

              return GestureDetector(
                onTap: (){
                  Get.to(PdfViewerScreen(title:"${ note['title']}",pdfPath:note["notesPdf"] ,));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 14.h),
                
                  padding: EdgeInsets.all(16.sp),
                
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.r),
                
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor,
                        blurRadius: 8,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                
                  child: Row(
                    children: [
                      /// ICON
                      Container(
                        padding: EdgeInsets.all(12.sp),
                
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(
                            color: primaryColor.withOpacity(0.3),
                          ),
                        ),
                
                        child: const Icon(
                          Icons.menu_book_rounded,
                          color: primaryColor,
                        ),
                      ),
                
                      SizedBox(width: 14.w),
                
                      /// TEXT
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                
                          children: [
                            Text(
                              note['title'],
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                
                            SizedBox(height: 4.h),
                
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  note['subject'],
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                                  child: Text(
                                    "•",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16.sp,
                                      height: 1,
                                    ),
                                  ),
                                ),
                                Text(
                                  note['teacher'],
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                
                            SizedBox(height: 4.h),
                
                            Text(
                              note['date'],
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                
                      /// DOWNLOAD BUTTON
                      Container(
                        padding: EdgeInsets.all(8.sp),
                
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: blueColor.withOpacity(0.3)),
                        ),
                
                        child: const Icon(Icons.download, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// ASSIGNMENT TAB
  Widget _buildAssignmentTab() {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "Recent Assignments",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: kTextMuted,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),

            itemCount: assignmentList.length,

            itemBuilder: (context, index) {
              final assignment = assignmentList[index];

              return GestureDetector(
                onTap: (){
                  Get.to(PdfViewerScreenAssignment(title: assignment["title"], pdfPath: assignment["assignmentPdf"],));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 14.h),
                
                  padding: EdgeInsets.all(16.sp),
                
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.r),
                
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor,
                        blurRadius: 8,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                
                  child: Row(
                    children: [
                      /// ICON
                      Container(
                        padding: EdgeInsets.all(12.sp),
                
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(
                            color: Colors.orange.withOpacity(0.2),
                          ),
                        ),
                
                        child: const Icon(Icons.assignment, color: Colors.orange),
                      ),
                
                      SizedBox(width: 14.w),
                
                      /// TEXT
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                
                          children: [
                            Text(
                              assignment['title'],
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                
                            SizedBox(height: 4.h),
                
                            Text(
                              assignment['subject'],
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13.sp,
                              ),
                            ),
                
                            SizedBox(height: 4.h),
                
                            Text(
                              "Deadline: ${assignment['deadline']}",
                              style: TextStyle(
                                color: Colors.red.shade400,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                
                      /// VIEW BUTTON
                      Container(
                        padding: EdgeInsets.all(8.sp),
                
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: primaryColor.withOpacity(0.1),
                          ),
                        ),
                
                        child: const Icon(Icons.visibility, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
