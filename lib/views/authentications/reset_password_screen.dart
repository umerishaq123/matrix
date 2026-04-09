import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/enum_type.dart';
import 'package:matrix/core/widgets/custom_button_widget.dart';
import 'package:matrix/core/widgets/custom_snackbar.dart';
import 'package:matrix/core/widgets/custom_text_form_field_widget.dart';
import 'package:matrix/views/authentications/signup_screen.dart';
import 'package:matrix/views/authentications/verify_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  const ResetPasswordScreen({super.key, required this.email});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
   TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: CustomTextFieldWidget(
                  controller: passwordcontroller,
                  name: "Password",
                  hintText: "Enter a password",
                   passwordField: true,
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: CustomTextFieldWidget(
                  controller: confirmPasswordController,
                  name: "Confirm Password",
                  hintText: "Enter a confirm password",
                   passwordField: true,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: CustomButtonWidget(
                  title: "Reset Password",
                  color: primaryColor,
                  onTap: () {
                    submit();
                  
                  },
                ),
              ),
            ],
          ),
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
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(Icons.lock, color: secondaryColor, size: 30),
          ),
          const SizedBox(height: 12),
          const Text(
            'Reset Password',
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


  Future<void> submit()async{
    if(passwordcontroller.text.isEmpty){
      return showCustomSnackBar(context: context,message: "password is required",status: StateType.failure);
    }else if(confirmPasswordController.text.isEmpty){
          return showCustomSnackBar(context: context,message: "confirm password is required",status: StateType.failure);

    }else if(passwordcontroller.text !=confirmPasswordController.text){
          return showCustomSnackBar(context: context,message: "password are not match",status: StateType.failure);

    }else{
        Get.to(SignupScreen());
    }
  }
}
