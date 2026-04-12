import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/models/admin/teachers_admin_model.dart';
import 'package:matrix/views/admin/teachers/teacher_list.dart';
import 'package:matrix/views/admin/teachers/widgets/section_card_widget.dart';
import 'package:matrix/views/admin/teachers/widgets/section_theme.dart';

class SectionStudentGridPage extends StatelessWidget {
  final int classNumber;
  const SectionStudentGridPage({super.key, required this.classNumber});

  @override
  Widget build(BuildContext context) {
    final sections = ['Iris', 'Daisy', 'Jasmine', 'Aster'];
    final classData = schoolData[classNumber]!;

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
            children: sections.map((sec) {
              final theme = sectionThemes[sec]!;
              final data = classData[sec]!;
              return SectionCard(
                section: sec,
                theme: theme,
                teacherCount: data.teachers.length,
                studentCount: data.students,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TeacherListPage(
                        classNumber: classNumber,
                        section: sec,
                        sectionData: data,
                        theme: theme,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
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
