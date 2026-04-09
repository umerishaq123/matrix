import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/enum_type.dart';
import 'package:matrix/core/widgets/custom_button_widget.dart';
import 'package:matrix/core/widgets/custom_snackbar.dart';
import 'package:matrix/core/widgets/custom_text_form_field_widget.dart';
import 'package:matrix/views/authentications/forgot_password_screen.dart';
import 'package:matrix/views/authentications/reset_password_screen.dart';
import 'package:pinput/pinput.dart';

class VerifyScreen extends StatefulWidget {
  final String email;
  const VerifyScreen({super.key, required this.email});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  SmsRetriever? smsRetriever;
  final TextEditingController _pinController = TextEditingController();
  FocusNode? focusNode;
  GlobalKey<FormState>? formKey;

  final defaultPinTheme = PinTheme(
    width: 46,
    height: 46,
    textStyle: const TextStyle(
      fontSize: 18,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: blackColor),
    ),
  );

  double? width;
  double? height;
  @override
  void initState() {
    super.initState();
    _pinController.addListener(() {
      setState(() {}); // Rebuild on every input change
    });
  }

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
              pinPutFieldWidget(),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: CustomButtonWidget(
                  title: "Verify Otp",
                  color: primaryColor,
                  onTap: () {
                    if (_pinController.text.length < 4) {
                      // only check if all digits not filled
                      return showCustomSnackBar(
                        context: context,
                        message: "Please enter OTP",
                        status: StateType.failure,
                      );
                    } else {
                      Get.to(ResetPasswordScreen(email: widget.email));
                    }
                  },
                ),
              ),
              Center(child: _resendOtpWidget()),
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
            child: const Icon(Icons.email, color: secondaryColor, size: 30),
          ),
          const SizedBox(height: 12),
          const Text(
            'Verify Otp',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Enter the OTP sent to your email.',
            style: TextStyle(
              color: secondaryColor.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget pinPutFieldWidget() {
    return SizedBox(
      width: width,
      child: Pinput(
        length: 4,
        // You can pass your own SmsRetriever implementation based on any package
        // in this example we are using the SmartAuth
        smsRetriever: smsRetriever,
        controller: _pinController,
        focusNode: focusNode,
        defaultPinTheme: PinTheme(
          width: 46,
          height: 46,
          textStyle: const TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(30, 60, 87, 1),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: whiteColor),
          ),
        ),
        separatorBuilder: (index) => const SizedBox(width: 8),
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: primaryColor,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: primaryColor),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: whiteColor,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: primaryColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: redColor),
        ),
      ),
    );
  }

  Widget _resendOtpWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't receive the code?",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () {
            // Get.off(ForgotPasswordScreen())
          },
          child: Text(
            "Resend it",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
