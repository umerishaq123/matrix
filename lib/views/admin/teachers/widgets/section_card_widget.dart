import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/views/admin/teachers/widgets/section_theme.dart';

class SectionCard extends StatelessWidget {
  final String section;
  final SectionTheme theme;
  final int teacherCount;
  final int studentCount;
  final VoidCallback onTap;

  const SectionCard({
    required this.section,
    required this.theme,
    required this.teacherCount,
    required this.studentCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.borderColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.color, theme.color.withOpacity(0.6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        section.length > 4
                            ? section.substring(0, 4).toUpperCase()
                            : section.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: theme.bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$teacherCount',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: theme.color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '$section',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$teacherCount teachers · $studentCount students',
              style: const TextStyle(fontSize: 12, color: kTextMuted),
            ),
          ],
        ),
      ),
    );
  }
}
