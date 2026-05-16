class StudentAdminModel {
  String? name;
  String? gender;
  String? className;
  String? section;
  String? rollNum;

  StudentAdminModel({this.className,this.gender,this.name,this.rollNum,this.section});
}


  final List<StudentAdminModel> studentData = [
    StudentAdminModel(
      name: "malik talha",
      gender: "male",
      className: "9",
      section: "Iris",
      rollNum: "01",
    ),
    StudentAdminModel(
      name: "malik qasim",
      gender: "male",
      className: "10",
      section: "Daisy",
      rollNum: "02",
    ),
    StudentAdminModel(
      name: "malik qasim",
      gender: "male",
      className: "10",
      section: "Daisy",
      rollNum: "02",
    ),
    StudentAdminModel(
      name: "Syeda Humna Naqvi",
      gender: "Female",
      className: "11",
      section: "Jasmine",
      rollNum: "12",
    ),
    StudentAdminModel(
      name: "Maryam",
      gender: "Female",
      className: "12",
      section: "Aster",
      rollNum: "13",
    ),
       StudentAdminModel(
      name: "Maryam",
      gender: "Female",
      className: "10",
      section: "Aster",
      rollNum: "13",
    ),
      StudentAdminModel(
      name: "eman",
      gender: "Female",
      className: "10",
      section: "Aster",
      rollNum: "13",
    ),
  ];


