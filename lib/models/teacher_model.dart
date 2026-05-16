class TeacherModel {
  final int id;
  final String name;
  final String gender;
  final String phoneNumber;
  final String className;
  final String section;
  final String subject;
  final String role;
  final String email;
  final bool isClassTeacher;

  TeacherModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.phoneNumber,
    required this.className,
    required this.section,
    required this.subject,
    required this.role,
    required this.email,
    required this.isClassTeacher,
  });
}

List<TeacherModel> teacherData = [
  TeacherModel(
    id: 1,
    name: "Ali Khan",
    gender: "Male",
    phoneNumber: "03001234567",
    className: "10",
    section: "Aster",
    subject: "Math",
    role: "Teacher",
    email: "ali.khan@gmail.com",
    isClassTeacher: true,
  ),
  TeacherModel(
    id: 1,
    name: "Sara Ahmed",
    gender: "Female",
    phoneNumber: "03111234567",
    className: "09",
    section: "Aster",
    subject: "Science",
    role: "Teacher",
    email: "sara.ahmed@gmail.com",
    isClassTeacher: false,
  ),
  TeacherModel(
    id: 3,
    name: "Usman Ali",
    gender: "Male",
    phoneNumber: "03221234567",
    className: "12",
    section: "Jasmine",
    subject: "English",
    role: "Teacher",
    email: "usman.ali@gmail.com",
    isClassTeacher: false,
  ),
];
