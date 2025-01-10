import 'package:clay_admin/view/utils/app_text_styles.dart';
import 'package:clay_admin/view/utils/constants/string_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ResponsiveLoginScreen extends StatelessWidget {
  const ResponsiveLoginScreen({Key? key}) : super(key: key);

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
                // Left side: Image
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
                    child: _buildLoginForm(context,width/5),
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
                    _buildLoginForm(context,width),
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
        Text(createAccount,style: AppTextStyle.bold(),),
        SizedBox(height: 20,),
        SizedBox(
          width: 400,
          height: 60,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: ' Enter Your Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Color(0xFFED1B24),
                  width: 2.0,
                ),
              ),
            ),
          ),

        ),
        const SizedBox(height: 16),

        SizedBox(
          width: 400,
          height: 60,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter Your Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Color(0xFFED1B24), // Focus color
                  width: 2.0, // Optional: You can adjust the width of the border
                ),
              ),
            ),
          ),

        ),
        const SizedBox(height: 24),

        SizedBox(
          width: 110,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFED1B24),
              minimumSize: Size(buttonWidth, 50),
            ),
            child: const Text(
              login,
              style: TextStyle(color: Colors.white),
            ),
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

