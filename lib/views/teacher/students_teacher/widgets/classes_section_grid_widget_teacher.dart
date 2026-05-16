import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/models/admin/student_admin_model.dart';
import 'package:matrix/models/teacher_model.dart';
import 'package:matrix/views/admin/teachers/widgets/section_theme.dart';
import 'package:matrix/views/teacher/students_teacher/students_list.dart';
import 'package:matrix/views/teacher/students_teacher/widgets/section_card_teacher_widget.dart';

class SectionStudentGridPageTeacher extends StatelessWidget {
  final int classNumber;
  final List<StudentAdminModel> studentdata;

  const SectionStudentGridPageTeacher({
    super.key,
    required this.classNumber,
    required this.studentdata,
  });

  @override
  Widget build(BuildContext context) {
    final sections = ['Iris', 'Daisy', 'Jasmine', 'Aster'];

    // ✅ Current Teacher ID
    int currentTeacherId = 1;

    // ✅ Check access function
    bool hasAccess(String section) {
      return teacherData.any(
        (t) =>
            t.id == currentTeacherId &&
            t.className == classNumber.toString() &&
            t.section == section,
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_sectionLabel('Choose a Section')],
          ),
          SizedBox(height: 5.h),

          GridView.count(
            padding: EdgeInsets.zero,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(sections.length, (index) {
              final sec = sections[index];
              final theme = sectionThemes[sec]!;

              bool isAllowed = hasAccess(sec);

              return Stack(
                children: [
                  Opacity(
                    opacity: isAllowed ? 1 : 0.4,
                    child: SectionStudentCardTeacher(
                      section: sec,
                      theme: theme,
                      teacherCount: 2,
                      studentCount: 4,
                      onTap: isAllowed
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => StudentListTeacher(
                                    classNumber: classNumber,
                                    section: sec,
                                    sectionData: studentdata,
                                    theme: theme,
                                  ),
                                ),
                              );
                            }
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Access denied")),
                              );
                            },
                    ),
                  ),

                  // 🔒 LOCK ICON
                  if (!isAllowed)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: kTextMuted,
        letterSpacing: 0.08 * 11,
        fontFamily: 'Poppins',
      ),
    );
  }
}
