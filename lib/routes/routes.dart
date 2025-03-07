import 'package:get/route_manager.dart';
import 'package:lms/routes/routes_named.dart';
import 'package:lms/screens/app/home_screen.dart';
import 'package:lms/screens/app/navigation_screen.dart';
import 'package:lms/screens/auth/login_screen.dart';
import 'package:lms/screens/auth/signup_screen.dart';
import 'package:lms/screens/onBoarding/onboarding.dart';
import 'package:lms/screens/teacher/addCourse_screen.dart';

class Routes {
  static final pages = [
    GetPage(name: RoutesNamed.signIn, page: () => LoginScreen()),
    GetPage(name: RoutesNamed.signUp, page: () => SignUpScreen()),
    GetPage(name: RoutesNamed.home, page: () => HomeScreen()),
    GetPage(name: RoutesNamed.onboard, page: () => OnboardingScreen()),
    GetPage(
      name: RoutesNamed.bottomNavBar,
      page: () => BottomNavBar(),
    ),
    GetPage(
      name: RoutesNamed.addCourseScreen,
      page: () => AddCourseScreen(),
    ),
  ];
}
