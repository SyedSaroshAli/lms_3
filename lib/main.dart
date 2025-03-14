import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lms/controllers/course_controller.dart';
import 'package:lms/controllers/enrollment_controller.dart';
import 'package:lms/controllers/reviews_controller.dart';
import 'package:lms/routes/routes.dart';
import 'package:lms/routes/routes_named.dart';
import 'package:lms/screens/app/courseDetail_screen.dart';
import 'package:lms/screens/app/getEnroll_screen1.dart';
import 'package:lms/screens/app/getEnroll_screen3.dart';
import 'package:lms/screens/app/home_screen.dart';
import 'package:lms/screens/app/inbox_screen.dart';
import 'package:lms/screens/app/myCourses_screen.dart';
import 'package:lms/screens/app/navigation_screen.dart';
import 'package:lms/screens/profile/profile_screen.dart';
import 'package:lms/screens/app/settings_screen.dart';
import 'package:lms/screens/auth/completeProfile_screen.dart';
import 'package:lms/screens/auth/reserPassDone_screen.dart';
import 'package:lms/screens/auth/resetPass_screen.dart';
import 'package:lms/screens/auth/login_screen.dart';
import 'package:lms/screens/auth/signup_screen.dart';
import 'package:lms/screens/onBoarding/onboarding.dart';
import 'package:lms/screens/onBoarding/splash_screen.dart';
import 'package:lms/screens/teacher/addCourse_screen.dart';
import 'package:lms/screens/teacher/addCourse_screen1.dart';
import 'package:lms/screens/teacher/addChapter_screen.dart';
import 'package:lms/screens/teacher/myCourses_screen.dart';
import 'package:lms/screens/teacher/teacherCourseDetail_screen.dart';
import 'package:lms/services/storage_service.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:lms/widgets/teacherCourse_tile.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Supabase.initialize(
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdwbW91dm9jZ3FwdG9reGZ0ZW5rIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA5ODkwODksImV4cCI6MjA1NjU2NTA4OX0.VttjpE-E9wqQt_D7jc9SNiYvZvZtihof-0QJ18HEj_c",
      url: "https://gpmouvocgqptokxftenk.supabase.co");

  await Future.delayed(
      Duration(seconds: 2)); // Give Supabase time to initialize
  Get.put(SupabaseService());
  Get.put(CourseController());
  Get.put(ReviewsController());
  Get.put(EnrollmentsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
      // home: TeacherCourseDetailScreen(
      //   id: "2d22d",
      //   title: 'Graphic Design',
      //   price: 20,
      //   length: '60',
      //   certificate: true,
      //   duration: '1 Week',
      //   discount: 30,
      //   imageurl: '',
      //   description: 'This is graphic design Course',
      // ),
      initialRoute: StorageService.userSession != null
          ? RoutesNamed.bottomNavBar
          : RoutesNamed.onboard,
    );
  }
}
