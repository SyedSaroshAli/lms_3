import 'package:flutter/material.dart';
import 'package:lms/screens/app/courseDetail_screen.dart';
import 'package:lms/screens/app/getEnroll_screen1.dart';
import 'package:lms/screens/app/getEnroll_screen3.dart';
import 'package:lms/screens/app/home_screen.dart';
import 'package:lms/screens/app/inbox_screen.dart';
import 'package:lms/screens/app/navigation_screen.dart';
import 'package:lms/screens/app/profile_screen.dart';
import 'package:lms/screens/app/settings_screen.dart';
import 'package:lms/screens/auth/reserPassDone_screen.dart';
import 'package:lms/screens/auth/resetPass_screen.dart';
import 'package:lms/screens/auth/signIn_screen.dart';
import 'package:lms/screens/auth/signUp_screen.dart';
import 'package:lms/screens/onBoarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: InboxScreen());
  }
}
