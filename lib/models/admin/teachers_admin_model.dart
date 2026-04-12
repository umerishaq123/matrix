import 'dart:ui';

import 'package:matrix/core/constants/colors.dart';

class Teacher {
  final String initials;
  final String name;
  final String subject;
  final List<String> tags;
  final int experience;
  final double rating;
  final Color avatarColor;
  final Color accentColor;
 
  const Teacher({
    required this.initials,
    required this.name,
    required this.subject,
    required this.tags,
    required this.experience,
    required this.rating,
    required this.avatarColor,
    required this.accentColor,
  });
}
 
class SectionData {
  final int students;
  final List<Teacher> teachers;
  const SectionData({required this.students, required this.teachers});
}
 


 
final Map<int, Map<String, SectionData>> schoolData = {
  9: {
    'Iris': SectionData(students: 38, teachers: [
      Teacher(initials: 'RS', name: 'Mr. Rahul Sharma', subject: 'Mathematics', tags: ['Algebra', 'Geometry'], experience: 12, rating: 4.9, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'PK', name: 'Ms. Priya Kapoor', subject: 'Science', tags: ['Physics', 'Chemistry'], experience: 8, rating: 4.7, avatarColor: kCoral, accentColor: kCoral),
      Teacher(initials: 'AN', name: 'Mrs. Anjali Nair', subject: 'English', tags: ['Grammar', 'Literature'], experience: 10, rating: 4.8, avatarColor: kGreen, accentColor: kGreen),
      Teacher(initials: 'SK', name: 'Mr. Suresh Kumar', subject: 'Social Studies', tags: ['History', 'Civics'], experience: 15, rating: 4.6, avatarColor: kAmber, accentColor: kAmber),
    ]),
    'Daisy': SectionData(students: 35, teachers: [
      Teacher(initials: 'VM', name: 'Ms. Vidya Menon', subject: 'Mathematics', tags: ['Algebra', 'Stats'], experience: 14, rating: 5.0, avatarColor: kPurple, accentColor: kPurple),
      Teacher(initials: 'AJ', name: 'Mr. Arun Joshi', subject: 'Science', tags: ['Physics', 'Biology'], experience: 9, rating: 4.8, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'NR', name: 'Mrs. Neha Rao', subject: 'English', tags: ['Writing', 'Poetry'], experience: 11, rating: 4.9, avatarColor: kCoral, accentColor: kCoral),
      Teacher(initials: 'DV', name: 'Mr. Dev Verma', subject: 'Hindi', tags: ['Grammar', 'Essay'], experience: 7, rating: 4.5, avatarColor: kGreen, accentColor: kGreen),
    ]),
    'Jasmine': SectionData(students: 40, teachers: [
      Teacher(initials: 'HM', name: 'Dr. Harish Mishra', subject: 'Mathematics', tags: ['Calculus', 'Stats'], experience: 20, rating: 5.0, avatarColor: kCoral, accentColor: kCoral),
      Teacher(initials: 'LC', name: 'Ms. Lavanya Chand', subject: 'Science', tags: ['Chemistry', 'Bio'], experience: 12, rating: 4.9, avatarColor: kGreen, accentColor: kGreen),
      Teacher(initials: 'FA', name: 'Mr. Farhan Ali', subject: 'Social Studies', tags: ['Geography', 'History'], experience: 8, rating: 4.7, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'SD', name: 'Mrs. Sneha Das', subject: 'English', tags: ['Literature', 'Drama'], experience: 11, rating: 4.8, avatarColor: kPurple, accentColor: kPurple),
    ]),
    'Aster': SectionData(students: 33, teachers: [
      Teacher(initials: 'KS', name: 'Dr. Karan Singh', subject: 'Mathematics', tags: ['Algebra', 'Trig'], experience: 18, rating: 4.9, avatarColor: kAmber, accentColor: kAmber),
      Teacher(initials: 'SP', name: 'Ms. Swati Patel', subject: 'Science', tags: ['Biology', 'Ecology'], experience: 13, rating: 4.8, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'RG', name: 'Mrs. Rekha Gupta', subject: 'Hindi', tags: ['Prose', 'Poetry'], experience: 16, rating: 4.7, avatarColor: kPurple, accentColor: kPurple),
      Teacher(initials: 'MB', name: 'Mr. Mohan Bhat', subject: 'Social Studies', tags: ['Civics', 'History'], experience: 10, rating: 4.6, avatarColor: kCoral, accentColor: kCoral),
    ]),
  },
  10: {
    'Iris': SectionData(students: 42, teachers: [
      Teacher(initials: 'RS', name: 'Mr. Rajesh Soni', subject: 'Mathematics', tags: ['Trigonometry', 'Algebra'], experience: 14, rating: 4.9, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'KM', name: 'Ms. Kavita Mehta', subject: 'Physics', tags: ['Mechanics', 'Optics'], experience: 10, rating: 4.8, avatarColor: kGreen, accentColor: kGreen),
      Teacher(initials: 'AV', name: 'Mr. Amit Verma', subject: 'Chemistry', tags: ['Organic', 'Inorganic'], experience: 9, rating: 4.7, avatarColor: kCoral, accentColor: kCoral),
      Teacher(initials: 'PR', name: 'Mrs. Pooja Rana', subject: 'Biology', tags: ['Genetics', 'Ecology'], experience: 12, rating: 4.9, avatarColor: kAmber, accentColor: kAmber),
    ]),
    'Daisy': SectionData(students: 38, teachers: [
      Teacher(initials: 'VT', name: 'Ms. Vini Tiwari', subject: 'Mathematics', tags: ['Calculus', 'Stats'], experience: 11, rating: 4.8, avatarColor: kPurple, accentColor: kPurple),
      Teacher(initials: 'SS', name: 'Mr. Sahil Shah', subject: 'Physics', tags: ['Electricity', 'Waves'], experience: 8, rating: 4.7, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'DP', name: 'Dr. Divya Pillai', subject: 'Chemistry', tags: ['Physical', 'Organic'], experience: 15, rating: 5.0, avatarColor: kCoral, accentColor: kCoral),
      Teacher(initials: 'RK', name: 'Mr. Rajan Kumar', subject: 'English', tags: ['Writing', 'Comprehension'], experience: 7, rating: 4.6, avatarColor: kGreen, accentColor: kGreen),
    ]),
    'Jasmine': SectionData(students: 41, teachers: [
      Teacher(initials: 'NJ', name: 'Mrs. Nidhi Jain', subject: 'Mathematics', tags: ['Algebra', 'Geometry'], experience: 13, rating: 4.9, avatarColor: kAmber, accentColor: kAmber),
      Teacher(initials: 'PB', name: 'Mr. Punit Biswal', subject: 'Science', tags: ['Physics', 'Chemistry'], experience: 9, rating: 4.7, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'MK', name: 'Ms. Meera Kutty', subject: 'English', tags: ['Literature', 'Drama'], experience: 10, rating: 4.8, avatarColor: kPurple, accentColor: kPurple),
      Teacher(initials: 'AL', name: 'Mr. Aarav Lal', subject: 'Social Studies', tags: ['History', 'Geography'], experience: 6, rating: 4.5, avatarColor: kCoral, accentColor: kCoral),
    ]),
    'Aster': SectionData(students: 36, teachers: [
      Teacher(initials: 'TN', name: 'Ms. Tanya Negi', subject: 'Mathematics', tags: ['Stats', 'Calculus'], experience: 11, rating: 4.8, avatarColor: kGreen, accentColor: kGreen),
      Teacher(initials: 'BM', name: 'Mr. Bharat Misra', subject: 'Science', tags: ['Biology', 'Physics'], experience: 14, rating: 4.9, avatarColor: kAmber, accentColor: kAmber),
      Teacher(initials: 'RI', name: 'Mrs. Ritu Iyer', subject: 'Hindi', tags: ['Grammar', 'Essay'], experience: 12, rating: 4.7, avatarColor: kPurple, accentColor: kPurple),
      Teacher(initials: 'JC', name: 'Mr. James Chacko', subject: 'English', tags: ['Writing', 'Grammar'], experience: 8, rating: 4.6, avatarColor: kBlue, accentColor: kBlue),
    ]),
  },
  11: {
    'Iris': SectionData(students: 34, teachers: [
      Teacher(initials: 'KS', name: 'Dr. Kiran Saxena', subject: 'Physics', tags: ['Quantum', 'Thermo'], experience: 18, rating: 5.0, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'SP', name: 'Ms. Sunita Pillai', subject: 'Chemistry', tags: ['Organic', 'Inorganic'], experience: 13, rating: 4.9, avatarColor: kGreen, accentColor: kGreen),
      Teacher(initials: 'AM', name: 'Mr. Ashok Menon', subject: 'Mathematics', tags: ['Calculus', 'Vectors'], experience: 16, rating: 4.8, avatarColor: kCoral, accentColor: kCoral),
      Teacher(initials: 'ZA', name: 'Ms. Zara Ahmad', subject: 'Biology', tags: ['Genetics', 'Anatomy'], experience: 9, rating: 4.7, avatarColor: kPurple, accentColor: kPurple),
    ]),
    'Daisy': SectionData(students: 36, teachers: [
      Teacher(initials: 'HD', name: 'Mr. Hemant Dubey', subject: 'Accountancy', tags: ['Audit', 'Tax'], experience: 15, rating: 4.9, avatarColor: kAmber, accentColor: kAmber),
      Teacher(initials: 'LN', name: 'Mrs. Leena Nair', subject: 'Economics', tags: ['Micro', 'Macro'], experience: 11, rating: 4.8, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'RB', name: 'Mr. Rohit Batra', subject: 'Business Studies', tags: ['Marketing', 'Finance'], experience: 10, rating: 4.6, avatarColor: kCoral, accentColor: kCoral),
      Teacher(initials: 'SK', name: 'Ms. Sonal Kaur', subject: 'English', tags: ['Literature', 'Grammar'], experience: 8, rating: 4.7, avatarColor: kGreen, accentColor: kGreen),
    ]),
    'Jasmine': SectionData(students: 32, teachers: [
      Teacher(initials: 'PA', name: 'Mrs. Preeti Arora', subject: 'Political Science', tags: ['Governance', 'IR'], experience: 12, rating: 4.8, avatarColor: kPurple, accentColor: kPurple),
      Teacher(initials: 'NA', name: 'Mr. Nikhil Achary', subject: 'History', tags: ['Modern', 'Medieval'], experience: 14, rating: 4.9, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'GR', name: 'Ms. Geeta Roy', subject: 'Geography', tags: ['Physical', 'Human'], experience: 9, rating: 4.7, avatarColor: kCoral, accentColor: kCoral),
      Teacher(initials: 'MV', name: 'Mr. Manoj Varma', subject: 'Sociology', tags: ['Culture', 'Society'], experience: 11, rating: 4.6, avatarColor: kGreen, accentColor: kGreen),
    ]),
    'Aster': SectionData(students: 35, teachers: [
      Teacher(initials: 'IS', name: 'Dr. Isha Sharma', subject: 'Physics', tags: ['Optics', 'Electricity'], experience: 17, rating: 5.0, avatarColor: kAmber, accentColor: kAmber),
      Teacher(initials: 'VR', name: 'Mr. Vijay Rajan', subject: 'Mathematics', tags: ['Algebra', 'Stats'], experience: 12, rating: 4.8, avatarColor: kPurple, accentColor: kPurple),
      Teacher(initials: 'CB', name: 'Mrs. Chitra Bose', subject: 'Chemistry', tags: ['Physical', 'Analytical'], experience: 10, rating: 4.7, avatarColor: kCoral, accentColor: kCoral),
      Teacher(initials: 'FZ', name: 'Ms. Fatima Zaidi', subject: 'Biology', tags: ['Ecology', 'Botany'], experience: 8, rating: 4.9, avatarColor: kBlue, accentColor: kBlue),
    ]),
  },
  12: {
    'Iris': SectionData(students: 30, teachers: [
      Teacher(initials: 'HM', name: 'Dr. Harish Mishra', subject: 'Mathematics', tags: ['Calculus', 'Stats'], experience: 20, rating: 5.0, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'LC', name: 'Ms. Lavanya Chand', subject: 'Chemistry', tags: ['Organic', 'Physical'], experience: 12, rating: 4.9, avatarColor: kGreen, accentColor: kGreen),
      Teacher(initials: 'AS', name: 'Mr. Aditya Sinha', subject: 'Physics', tags: ['Quantum', 'Waves'], experience: 15, rating: 4.9, avatarColor: kCoral, accentColor: kCoral),
      Teacher(initials: 'BR', name: 'Mrs. Bela Rao', subject: 'English', tags: ['Writing', 'Prose'], experience: 11, rating: 4.7, avatarColor: kPurple, accentColor: kPurple),
    ]),
    'Daisy': SectionData(students: 28, teachers: [
      Teacher(initials: 'NK', name: 'Mr. Naveen Kumar', subject: 'Accountancy', tags: ['Tax', 'Audit'], experience: 16, rating: 4.9, avatarColor: kAmber, accentColor: kAmber),
      Teacher(initials: 'ST', name: 'Ms. Shruti Tiwari', subject: 'Economics', tags: ['Micro', 'Statistics'], experience: 13, rating: 4.8, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'PD', name: 'Mr. Pranav Dixit', subject: 'Business Studies', tags: ['Management', 'Finance'], experience: 9, rating: 4.7, avatarColor: kPurple, accentColor: kPurple),
      Teacher(initials: 'UA', name: 'Mrs. Uma Anand', subject: 'English', tags: ['Literature', 'Poem'], experience: 14, rating: 4.8, avatarColor: kCoral, accentColor: kCoral),
    ]),
    'Jasmine': SectionData(students: 31, teachers: [
      Teacher(initials: 'FA', name: 'Mr. Farhan Ali', subject: 'Political Science', tags: ['IR', 'Governance'], experience: 8, rating: 4.7, avatarColor: kGreen, accentColor: kGreen),
      Teacher(initials: 'SD', name: 'Mrs. Sneha Das', subject: 'Psychology', tags: ['Behavioral', 'Cognitive'], experience: 11, rating: 4.8, avatarColor: kPurple, accentColor: kPurple),
      Teacher(initials: 'TK', name: 'Dr. Tanvir Khan', subject: 'History', tags: ['Ancient', 'Modern'], experience: 19, rating: 5.0, avatarColor: kBlue, accentColor: kBlue),
      Teacher(initials: 'PG', name: 'Ms. Pallavi Ghosh', subject: 'Geography', tags: ['Climate', 'Maps'], experience: 10, rating: 4.6, avatarColor: kCoral, accentColor: kCoral),
    ]),
    'Aster': SectionData(students: 29, teachers: [
      Teacher(initials: 'JV', name: 'Mr. Jai Vora', subject: 'Mathematics', tags: ['Calculus', 'Algebra'], experience: 14, rating: 4.9, avatarColor: kAmber, accentColor: kAmber),
      Teacher(initials: 'RM', name: 'Dr. Ruchi Malhotra', subject: 'Physics', tags: ['Mechanics', 'Optics'], experience: 17, rating: 5.0, avatarColor: kCoral, accentColor: kCoral),
      Teacher(initials: 'GN', name: 'Mrs. Geetha Nambiar', subject: 'Biology', tags: ['Botany', 'Zoology'], experience: 12, rating: 4.8, avatarColor: kGreen, accentColor: kGreen),
      Teacher(initials: 'AK', name: 'Ms. Anika Kapoor', subject: 'Chemistry', tags: ['Organic', 'Physical'], experience: 9, rating: 4.7, avatarColor: kPurple, accentColor: kPurple),
    ]),
  },
};
 