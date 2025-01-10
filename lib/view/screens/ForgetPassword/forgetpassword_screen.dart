import 'package:clay_admin/view/utils/app_text_styles.dart';
import 'package:clay_admin/view/utils/constants/string_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../CreatePassword/createpassword_screen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFFF6F7),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (kIsWeb && constraints.maxWidth > 600) {
            return Row(
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/images/adminIcon.png',
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Flexible(
                  child: Center(
                    child: _buildLoginForm(context, width / 5),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/adminIcon.png',
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildLoginForm(context, width),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, double buttonWidth) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          forgetPassword,
          style: AppTextStyle.bold(),
        ),
        SizedBox(height: 20,),
        Text("The 'Forget Password' page enables admins to reset"),
        Text(" their passwords by entering their registered email"),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 400,
          height: 60,
          child: CustomTextField(
            hintText: enterYourEmailAddress,
            prefixIcon: Icon(Icons.lock),
            controller: emailController,
            obscureText: true,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 400,
          height: 60,
          child: CustomTextField(
            hintText: enterYourPassword,
            prefixIcon: Icon(Icons.lock),
            controller: emailController,
            obscureText: true,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 110,
          child: CustomButton(
            minimumSize: Size(buttonWidth, 50),
            backgroundColor: Color(0xFFED1B24),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePassword(),));
            },
            buttonText: login,
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            text: doNotHaveAccount,
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: signUp,
                style: const TextStyle(color: Color(0xFFED1B24)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigate to Sign Up
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
