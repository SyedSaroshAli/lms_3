import 'package:get/route_manager.dart';
import 'package:lms/routes/routes_named.dart';
import 'package:lms/screens/app/category_screen.dart';
import 'package:lms/screens/app/home_screen.dart';
import 'package:lms/screens/app/navigation_screen.dart';
import 'package:lms/screens/app/search_screen.dart';
import 'package:lms/screens/auth/login_screen.dart';
import 'package:lms/screens/auth/signup_screen.dart';
import 'package:lms/screens/onBoarding/onboarding.dart';
import 'package:lms/screens/profile/edit_profile.dart';
import 'package:lms/screens/teacher/addCourse_screen.dart';
import 'package:lms/screens/teacher/addChapter_screen.dart';

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
    GetPage(
      name: RoutesNamed.addChapterScreen,
      page: () => AddChapterScreen(),
    ),
    GetPage(
        name: RoutesNamed.editProfileScreen,
        page: () => EditProfile(),
        transition: Transition.rightToLeft),
    GetPage(
        name: RoutesNamed.categoryScreen,
        page: () => CategoryScreen(),
        transition: Transition.rightToLeft),
    GetPage(
      name: RoutesNamed.searchScreen,
      page: () => SearchScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
