import 'package:clay_admin/view/screens/CreateAccount/ctreate_account_screen.dart';
import 'package:clay_admin/view/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        splitScreenMode: true,
        // designSize: Size(390, 844),
        minTextAdapt: true,
        builder: (context, child){
           return CreateAccount();
        },
      )
    );
  }
}
