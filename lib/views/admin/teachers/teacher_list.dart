import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/models/admin/teachers_admin_model.dart';
import 'package:matrix/views/admin/teachers/widgets/section_theme.dart';

class TeacherListPage extends StatelessWidget {
  final int classNumber;
  final String section;
  final SectionData sectionData;
  final SectionTheme theme;

  const TeacherListPage({
    super.key,
    required this.classNumber,
    required this.section,
    required this.sectionData,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ Null-safe fallback
    final List<Teacher> teachers = sectionData.teachers ?? [];
    final int students = sectionData.students ?? 0;

    return Scaffold(
      backgroundColor: secondaryColor,
      body: CustomScrollView(
        slivers: [
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
              icon: const Icon(Icons.arrow_back, size: 18, color: whiteColor),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r),bottomRight: Radius.circular(20.r)),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
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
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Section $section',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '${teachers.length} teachers assigned',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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

          /// Stats Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _StatCard(value: '${teachers.length}', label: 'Teachers'),
                      const SizedBox(width: 8),
                      _StatCard(value: '${teachers.length}', label: 'Subjects'),
                      const SizedBox(width: 8),
                      _StatCard(value: '$students', label: 'Students'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'FACULTY',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: kTextMuted,
                      letterSpacing: 0.9,
                    ),
                  ),
                  // const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          /// Teachers List
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final teacher = teachers[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: _TeacherCard(teacher: teacher),
              );
            }, childCount: teachers.length),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 10)),
        ],
      ),
    );
  }
}

/// ================= STAT CARD =================
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

/// ================= TEACHER CARD =================
class _TeacherCard extends StatelessWidget {
  final Teacher teacher;

  const _TeacherCard({required this.teacher});

  @override
  Widget build(BuildContext context) {
    final tags = teacher.tags ?? [];

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
                color: teacher.accentColor ?? primaryColor,
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
                          teacher.avatarColor ?? primaryColor,
                          (teacher.avatarColor ?? primaryColor).withOpacity(
                            0.6,
                          ),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        teacher.initials ?? 'NA',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// Teacher Info
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          teacher.name ?? 'Unknown Teacher',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kTextDark,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color:
                                teacher.accentColor.withOpacity(0.12) ??
                                primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            teacher.subject ?? 'No Subject',
                            style: TextStyle(
                              fontSize: 11,
                              color: teacher.accentColor,
                            ),
                          ),
                        ),
                        // const SizedBox(height: 6),
                        // Wrap(
                        //   spacing: 5,
                        //   children: tags
                        //       .map(
                        //         (tag) => _Tag(
                        //           label: tag,
                        //           color: teacher.accentColor ?? primaryColor,
                        //         ),
                        //       )
                        //       .toList(),
                        // ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  /// Experience & Rating
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       '${teacher.experience ?? 0}',
                  //       style: const TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.w700,
                  //         color: kTextDark,
                  //         height: 1,
                  //       ),
                  //     ),
                  //     const Text(
                  //       'yrs exp',
                  //       style: TextStyle(fontSize: 9, color: kTextMuted),
                  //     ),
                  //     const SizedBox(height: 6),
                  //     Row(
                  //       children: [
                  //         const Icon(
                  //           Icons.star_rounded,
                  //           color: kAmber,
                  //           size: 13,
                  //         ),
                  //         const SizedBox(width: 2),
                  //         Text(
                  //           (teacher.rating ?? 0.0).toStringAsFixed(1),
                  //           style: const TextStyle(
                  //             fontSize: 12,
                  //             fontWeight: FontWeight.w600,
                  //             color: kTextDark,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ================= TAG =================
class _Tag extends StatelessWidget {
  final String label;
  final Color color;

  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
}
