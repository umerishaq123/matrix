import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/models/admin/student_admin_model.dart';
import 'package:matrix/views/admin/teachers/widgets/section_theme.dart';

class StudentListAdmin extends StatelessWidget {
  final int classNumber;
  final String section;
  final List<StudentAdminModel> sectionData;
  final SectionTheme theme;

  const StudentListAdmin({
    super.key,
    required this.classNumber,
    required this.section,
    required this.sectionData,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final List<Color> listColors = [
      kAmber,
      kBlue,
      kCard,
      kCoral,
      kGreen,
    ];

    /// Filter students by class and section
    final List<StudentAdminModel> tstudents =
        sectionData.where((data) {
          int className =
              int.tryParse((data.className ?? '0').trim()) ?? 0;
          return classNumber == className &&
              section.toLowerCase().trim() ==
                  (data.section ?? '').toLowerCase().trim();
        }).toList();

    final int studentsCount = tstudents.length;

    return Scaffold(
      backgroundColor: secondaryColor,
      body: CustomScrollView(
        slivers: [
          /// ================= APP BAR =================
          SliverAppBar(
            expandedHeight: 90.h,
            pinned: true,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 18,
                color: whiteColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor, blueColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Class $classNumber',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Section $section',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          '4 teachers assigned',
                          style: TextStyle(
                            color: Color(0xAAFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// ================= STATS SECTION =================
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const _StatCard(value: '2', label: 'Teachers'),
                      const SizedBox(width: 8),
                      const _StatCard(value: '3', label: 'Subjects'),
                      const SizedBox(width: 8),
                      _StatCard(
                        value: '$studentsCount',
                        label: 'Students',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'STUDENTS',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: kTextMuted,
                      letterSpacing: 0.9,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// ================= EMPTY STATE =================
          if (tstudents.isEmpty)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  'No Data Found',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kTextMuted,
                  ),
                ),
              ),
            )
          else
            /// ================= STUDENT LIST =================
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final student = tstudents[index];
                  final color =
                      listColors[index % listColors.length];

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(
                        16, 0, 16, 10),
                    child: _StudentCard(
                      student: student,
                      cardColors: color,
                    ),
                  );
                },
                childCount: tstudents.length,
              ),
            ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
        ],
      ),
    );
  }
}

/// ================= STAT CARD =================
class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({
    required this.value,
    required this.label,
  });

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
              style: const TextStyle(
                fontSize: 10,
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ================= STUDENT CARD =================
class _StudentCard extends StatelessWidget {
  final StudentAdminModel student;
  final Color cardColors;

  const _StudentCard({
    required this.student,
    required this.cardColors,
  });

  /// Generate initials from student name
  String getInitials(String? name) {
    if (name == null || name.trim().isEmpty) return 'NA';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
    return parts[0]
        .substring(0, parts[0].length >= 2 ? 2 : 1)
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            /// Accent Bar
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: cardColors,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  /// Avatar
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          cardColors,
                          cardColors.withOpacity(0.6),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        getInitials(student.name),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// Student Info
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Text(
                          student.name ?? 'Unknown Student',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kTextDark,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: cardColors.withOpacity(0.2),
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Class: ${student.className ?? ''} . Roll-no: ${student.rollNum}",
                            style: const TextStyle(
                              fontSize: 11,
                              color: greyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
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