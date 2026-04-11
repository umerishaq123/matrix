import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrix/controlllers/teacher/create_teacher_controller.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/widgets/custom_button_widget.dart';
import 'package:matrix/core/widgets/custom_drop_down_widget.dart';
import 'package:matrix/core/widgets/custom_text_form_field_widget.dart';

class CreateStudent extends StatefulWidget {
  const CreateStudent({super.key});

  @override
  State<CreateStudent> createState() => _CreateStudentState();
}

class _CreateStudentState extends State<CreateStudent> {
  TextEditingController _fullName = TextEditingController();
  TextEditingController _admissionNumber = TextEditingController();
  TextEditingController _teacherEmail = TextEditingController();
  TextEditingController _passwordController=TextEditingController();
    TextEditingController _rollNumber=TextEditingController();

  String? selectedGender;
  String? selctedClass;
  String? selectedSubject;
  String? selectedRole;
  String? selctedSection;
  String? selectedParent;

  //controller
  CreateTeacherController _createTeacherController =
      Get.isRegistered<CreateTeacherController>()
      ? Get.find()
      : Get.put(CreateTeacherController());



      List<String>  parentsList=[
        "Ishaq",
        "Istiaq",
        "M.ishfaq",
        "M.ahsan",
        "M.sher khan"
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                children: [
                  CustomTextFieldWidget(
                    controller: _fullName,
                    name: "Full name",
                    hintText: "Enter a Full_name",
                  ),
                  SizedBox(height: 10.h),
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      return setState(() {
                        selectedGender = value;
                      });
                    },
                    defaultOption: "Select Gender",
                    width: double.infinity,
                    name: 'Select Gender',
                    labelBuilder: (item) => item, // <-- return the string itself
                    menuItems: ["Male", "Female", "other"],
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: _admissionNumber,
                    name: "Admission number",
                    hintText: "Enter a Admission number",
                    inputType: TextInputType.number,
                  ),
                      SizedBox(height: 10.h),
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      return setState(() {
                        selectedGender = value;
                      });
                    },
                    defaultOption: "Select class",
                    width: double.infinity,
                    name: 'Select Class',
                    labelBuilder: (item) => item, // <-- return the string itself
                    menuItems: ["9th", "10th", "1 year", "2 year"],
                  ),
                  SizedBox(height: 10.h),
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      return setState(() {
                        selectedSubject = value;
                      });
                    },
                    defaultOption: "Select subject",
                    width: double.infinity,
                    name: 'Select Subject',
                    labelBuilder: (item) => item, // <-- return the string itself
                    menuItems: _createTeacherController.subjects,
                  ),
                  SizedBox(height: 10.h),
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      return setState(() {
                        selectedSubject = value;
                      });
                    },
                    defaultOption: "Select role",
                    width: double.infinity,
                    name: 'Select role',
                    labelBuilder: (item) => item, // <-- return the string itself
                    menuItems: ["Teacher","Student"],
                  ),
                   SizedBox(height: 10.h),
                 
                  CustomDropdownWidgetWithModel<String>(
                    onSelected: (value) {
                      return setState(() {
                        selctedSection = value;
                      });
                    },
                    defaultOption: "Select Section",
                    width: double.infinity,
                    name: 'Select section',
                    labelBuilder: (item) => item, // <-- return the string itself
                    menuItems: ["A","B","C","D","E"],
                  ),
                       SizedBox(height: 10.h),
                   CustomDropdownWidgetWithModel<String>(
                   enabled: true,
                    onSelected: (value) {
                      return setState(() {
                        selectedParent = value;
                      });
                    },
                    defaultOption: "Select Parent",
                    width: double.infinity,
                    name: 'Select Parent',
                    labelBuilder: (item) => item, // <-- return the string itself
                    menuItems: parentsList,
                  ),
                   SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: _rollNumber,
                    name: "Roll number",
                    hintText: "Enter a Roll number",
                    inputType: TextInputType.number,
                  ),
                   SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: _teacherEmail,
                    name: "Email",
                    hintText: "Enter a Teacher eamil",
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                controller: _passwordController,
                name: "Password",
                inputType: TextInputType.text,
                passwordField: true,
                borderRadius: 15,
              ),
               SizedBox(height: 20.h),
               CustomButtonWidget(
                color: primaryColor,
                title: "Create Teacher",
                onTap: (){

                },
               ),
                    SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, color: whiteColor),
              ),
              SizedBox(width: 80.w),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(Icons.school, color: secondaryColor, size: 30),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Create Student',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Every student added today is a step toward a \n brighter tomorrow.',
            style: TextStyle(
              color: secondaryColor.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }



}
