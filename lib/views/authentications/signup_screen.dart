import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrix/core/constants/app_sizes.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/enum_type.dart';
import 'package:matrix/core/widgets/custom_button_widget.dart';
import 'package:matrix/core/widgets/custom_drop_down_widget.dart';
import 'package:matrix/core/widgets/custom_snackbar.dart';
import 'package:matrix/core/widgets/custom_text_form_field_widget.dart';
import 'package:matrix/core/widgets/email_validation.dart';
import 'package:matrix/views/admin/dashboard.dart';
import 'package:matrix/views/authentications/forgot_password_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isSignup = false;
  bool isCheck = false;
  String? selectedRole;
  String? selectedRoleSignup;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeySignIn = GlobalKey<FormState>();

  // controllers signup
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _adminCodeController = TextEditingController();

  //controller signin
  TextEditingController _emailSignInController = TextEditingController();
  TextEditingController _passwordSignInController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _adminCodeController.dispose();
    _emailSignInController.dispose();
    _passwordSignInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor.withOpacity(0.9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: height * 0.03),
              _buildBody(),
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
              Icons.school_rounded,
              color: secondaryColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Create account',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Join thousands of learners today',
            style: TextStyle(
              color: secondaryColor.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSwitcher() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          _tabItem(
            'Sign in',
            isActive: !isSignup,
            onTap: () {
              setState(() {
                isSignup = false;
              });
            },
          ),
          _tabItem(
            'Sign up',
            isActive: isSignup,
            onTap: () {
              setState(() {
                isSignup = true;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.mediumPadding(context)),
      child: Column(
        children: [
          _buildTabSwitcher(),
          const SizedBox(height: 20),
          isSignup ? signupForm() : signInForm(),
        ],
      ),
    );
  }

  Widget _tabItem(
    String label, {
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: isActive ? primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(9),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? whiteColor : Colors.blueGrey,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- SIGN UP FORM ----------------

  Widget signupForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFieldWidget(
            controller: _nameController,
            name: "Full name",
            inputType: TextInputType.text,
            borderRadius: 15,
          ),
          SizedBox(height: 10),
          CustomDropdownWidgetWithModel<String>(
            onSelected: (value) {
              return setState(() {
                selectedRoleSignup = value;
                // print("::::selected value:${selectedRole}");
              });
            },
            defaultOption: "Select role",
            width: double.infinity,
            name: 'Select Role',
            labelBuilder: (item) => item, // <-- return the string itself
            menuItems: ["admin", "teacher", "parent"],
          ),

          SizedBox(height: 10),
          CustomTextFieldWidget(
            controller: _emailController,
            name: "Email",
            inputType: TextInputType.emailAddress,
            borderRadius: 15,
          ),
          SizedBox(height: 10),
          CustomTextFieldWidget(
            controller: _passwordController,
            name: "Password",
            inputType: TextInputType.text,
            passwordField: true,
            borderRadius: 15,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                activeColor: primaryColor,
                value: isCheck,
                onChanged: (value) {
                  setState(() {
                    isCheck = value!;
                  });
                },
              ),
              const SizedBox(width: 5),
              const Text("Accept terms and condition"),
            ],
          ),
          SizedBox(height: 10),
          CustomButtonWidget(
            color: primaryColor,
            title: "Sign up",
            onTap: () {
              signupSubmit();
            },
          ),
          SizedBox(height: 10),
          Text.rich(
            TextSpan(
              text: "Already have an account? ",
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: "Sign in",
                  style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        isSignup = false;
                      });
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- SIGN IN FORM ----------------

  Widget signInForm() {
    return SingleChildScrollView(
      child: Form(
        key: _formKeySignIn,
        child: Column(
          mainAxisSize: MainAxisSize.min, // important!
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomDropdownWidgetWithModel<String>(
              onSelected: (value) {
                return setState(() {
                  selectedRole = value;
                  print("::::selected value:${selectedRole}");
                });
              },
              defaultOption: "Select role",
              width: double.infinity,
              name: 'Select Role',
              labelBuilder: (item) => item, // <-- return the string itself
              menuItems: ["admin", "teacher", "parent"],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomTextFieldWidget(
                controller: _emailSignInController,
                name: "Email",
                inputType: TextInputType.emailAddress,
                borderRadius: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomTextFieldWidget(
                controller: _passwordSignInController,
                name: "Password",
                inputType: TextInputType.text,
                passwordField: true,
                borderRadius: 15,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(ForgotPasswordScreen());
                  },
                  child: Text(
                    "Forgot Password",
                    style: GoogleFonts.poppins(color: primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomButtonWidget(
              color: primaryColor,
              title: "Sign In",
              onTap: () {
                if (_emailSignInController.text.isEmpty) {
                  return showCustomSnackBar(
                    context: context,
                    message: "Email is required",
                    status: StateType.failure,
                  );
                } else if (_passwordSignInController.text.isEmpty) {
                  return showCustomSnackBar(
                    context: context,
                    message: emailValidation(_emailSignInController.text),
                    status: StateType.failure,
                  );
                } else {
                  Get.to(AppDashboard());
                }

                // if (_formKeySignIn.currentState!.validate()) {
                //   // Perform sign-in
                // }
              },
            ),
            SizedBox(height: 10),
            Center(
              child: Text.rich(
                TextSpan(
                  text: "Don’t have an account? ",
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            isSignup = true;
                          });
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomButtonWidget(
              color: Colors.white,
              deleteButton: true,
              title: "Continue with Google",
              prefixIcon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
                size: 18,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signupSubmit() async {
    if (_nameController.text.isEmpty) {
      return showCustomSnackBar(
        context: context,
        message: "Name is required",
        status: StateType.failure,
      );
    } else if (_adminCodeController.text.isEmpty) {
      return showCustomSnackBar(
        context: context,
        message: "AminCode is required",
        status: StateType.failure,
      );
    } else if (_emailController.text.isEmpty) {
      return showCustomSnackBar(
        context: context,
        message: emailValidation(_emailController.text),
        status: StateType.failure,
      );
    } else if (_passwordController.text.isEmpty) {
      return showCustomSnackBar(
        context: context,
        message: "Password is required",
        status: StateType.failure,
      );
    } else if (!isCheck) {
      return showCustomSnackBar(
        context: context,
        message: "Please accept the term and condition",
        status: StateType.failure,
      );
    } else {
      setState(() {
        isSignup = false;
      });
    }
  }
}
