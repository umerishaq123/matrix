import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/models/admin/student_admin_model.dart';
import 'package:matrix/models/admin/teachers_admin_model.dart';
import 'package:matrix/views/admin/students/student_list.dart';
import 'package:matrix/views/admin/students/widgets/section_card_for_student.dart';
import 'package:matrix/views/admin/teachers/teacher_list.dart';
import 'package:matrix/views/admin/teachers/widgets/section_card_widget.dart';
import 'package:matrix/views/admin/teachers/widgets/section_theme.dart';

class SectionStudentGridPage extends StatelessWidget {
  final int classNumber;
  final List<StudentAdminModel> studentdata;
  const SectionStudentGridPage({
    super.key,
    required this.classNumber,
    required this.studentdata,
  });

  @override
  Widget build(BuildContext context) {
    final sections = ['Iris', 'Daisy', 'Jasmine', 'Aster'];
    // final classData = schoolData[classNumber]!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              _sectionLabel('Choose a Section'),

              // Container(
              //   padding: EdgeInsets.all(8.0),
              //   decoration: BoxDecoration(
              //     color: primaryColor,
              //     borderRadius: BorderRadius.circular(15.r),
              //   ),
              //   child: Text(
              //     "Add Section",

              //     style: const TextStyle(
              //       fontSize: 11,
              //       fontWeight: FontWeight.w600,
              //       color: whiteColor,
              //       letterSpacing: 0.08 * 11,
              //       fontFamily: 'Poppins',
              //     ),
              //   ),
              // ),
            ],
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
              final data = studentdata[index];

              return SectionStudentCard(
                section: sec,
                theme: theme,
                teacherCount: 2,
                studentCount: 4,
                onTap: () {

                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => StudentListAdmin(
                        classNumber: classNumber,
                        section: sec,
                        sectionData: studentdata,
                        theme: theme,
                      ),
                    ),
                  );
                },
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
