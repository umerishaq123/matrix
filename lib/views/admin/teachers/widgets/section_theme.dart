import 'dart:ui';

import 'package:matrix/core/constants/colors.dart';

class SectionTheme {
  final Color color;
  final Color bgColor;
  final Color borderColor;
  const SectionTheme({required this.color, required this.bgColor, required this.borderColor});
}
 
final sectionThemes = {
  'Iris': SectionTheme(color: kBlue, bgColor: const Color(0xFFEEF1FF), borderColor: const Color(0xFFD6DFFF)),
  'Daisy': SectionTheme(color: kCoral, bgColor: const Color(0xFFFFF0F0), borderColor: const Color(0xFFFFE0DC)),
  'Jasmine': SectionTheme(color: kGreen, bgColor: const Color(0xFFE6FAF4), borderColor: const Color(0xFFCCFAE7)),
  'Aster': SectionTheme(color: kAmber, bgColor: const Color(0xFFFFF8E1), borderColor: const Color(0xFFFFEDC0)),
};