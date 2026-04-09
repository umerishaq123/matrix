import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrix/controlllers/teacher/create_teacher_controller.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/widgets/custom_drop_down_widget.dart';
import 'package:matrix/core/widgets/custom_text_form_field_widget.dart';

class CreateTeacher extends StatefulWidget {
  const CreateTeacher({super.key});

  @override
  State<CreateTeacher> createState() => _CreateTeacherState();
}

class _CreateTeacherState extends State<CreateTeacher> {
  TextEditingController _fullName = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _teacherEmail = TextEditingController();

  String? selectedGender;
  String? selctedClass;
  String? selectedSubject;
  String? selectedRole;

  //controller
  CreateTeacherController _createTeacherController =
      Get.isRegistered<CreateTeacherController>()
      ? Get.find()
      : Get.put(CreateTeacherController());

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
                    name: 'Select Role',
                    labelBuilder: (item) => item, // <-- return the string itself
                    menuItems: ["Male", "Female", "other"],
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: _phoneNumber,
                    name: "Phone_number",
                    hintText: "Enter a phone number",
                    inputType: TextInputType.number,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: _teacherEmail,
                    name: "Email",
                    hintText: "Enter a Teacher eamil",
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
            'Create Teacher',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Enter your new password to secure your account.',
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
