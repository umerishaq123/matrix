import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/enum_type.dart';
import 'package:matrix/core/widgets/custom_button_widget.dart';
import 'package:matrix/core/widgets/custom_snackbar.dart';
import 'package:matrix/core/widgets/custom_text_form_field_widget.dart';
import 'package:matrix/core/widgets/email_validation.dart';
import 'package:matrix/views/authentications/verify_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 20.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                child: CustomTextFieldWidget(controller: emailController, name: "Email",hintText: "Enter a email e.g abc@gmail.com", ),
              ),
                 SizedBox(height: 20.h,),
                 Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                   child: CustomButtonWidget(
                    title: "Send Otp",
                    color: primaryColor,
                    onTap: (){
                      submit();
            
                      
                    },
                   ),
                 )
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
            child: const Icon(
              Icons.email,
              color: secondaryColor,
              size: 30,
            ),
          ),
         
         
         
          const SizedBox(height: 12),
          const Text(
            'Forgot Password',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Enter your email to receive the OTP.',
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
  if(emailController.text.isEmpty){
    return showCustomSnackBar(
        context: context,
        message: emailValidation(emailController.text),
        status: StateType.failure,
      );
  }else{
       Get.to(VerifyScreen(email: emailController.text,));
  }

}

}