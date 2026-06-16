class ParentsModelN {
  final String parentName;
  final int numChildren;
  final String gender;
  final String email;
  final String studentClass;
  final String section;
  final String studentName;
  final String rollNumber;
  final String admissionNumber;

  ParentsModelN({
    required this.parentName,
    required this.numChildren,
    required this.gender,
    required this.email,
    required this.studentClass,
    required this.section,
    required this.studentName,
    required this.rollNumber,
    required this.admissionNumber,
  });

  factory ParentsModelN.fromJson(Map<String, dynamic> json) {
    return ParentsModelN(
      parentName: json['parentName'] ?? '',
      numChildren: json['numChildren'] ?? 0,
      gender: json['gender'] ?? '',
      email: json['email'] ?? '',
      studentClass: json['studentClass'] ?? '',
      section: json['section'] ?? '',
      studentName: json['studentName'] ?? '',
      rollNumber: json['rollNumber'] ?? '',
      admissionNumber: json['admissionNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'parentName': parentName,
      'numChildren': numChildren,
      'gender': gender,
      'email': email,
      'studentClass': studentClass,
      'section': section,
      'studentName': studentName,
      'rollNumber': rollNumber,
      'admissionNumber': admissionNumber,
    };
  }
}
