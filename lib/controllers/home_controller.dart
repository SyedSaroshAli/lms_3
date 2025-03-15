import 'package:get/get.dart';

class HomeController extends GetxController {
  List popularCourses = [
    "All",
    "Grapic Design",
    "3D Design",
    "Arts & Humanities"
  ];

  List popularTeachers = [
    "All",
    "John Doe",
    "Jane Doe",
    "Alexa Doe",
  ];
  double initialPadding = 16;
  RxBool isScrolled = false.obs;

  void updateScrollPosition(double offset) {
    if (offset > 10) {
      isScrolled.value = true; // Remove padding
    } else {
      isScrolled.value = false; // Restore padding
    }
  }
}
