import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/course_controller.dart';
import 'package:lms/models/course_model.dart';
import 'package:lms/routes/routes_named.dart';
import 'package:lms/screens/app/navigation_screen.dart';
import 'package:lms/screens/onBoarding/onboarding_screen1.dart';
import 'package:lms/screens/onBoarding/onboarding_screen2.dart';
import 'package:lms/screens/onBoarding/onboarding_screen3.dart';
import 'package:lms/screens/onBoarding/onboarding_screen4.dart';
import 'package:lms/screens/onBoarding/onboarding_screen5.dart';
import 'package:lms/screens/teacher/addCourse_screen1.dart';
import 'package:lms/screens/teacher/addCourse_screen2.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:lms/utils/helper.dart';
import 'package:lms/widgets/buttonWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({super.key});

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController lecturesController = TextEditingController();
  final CourseController courseController = Get.put(CourseController());

  final PageController _controller = PageController();
  int currentPage = 0;
  final userId = SupabaseService.client.auth.currentUser!.id;
  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen =
        MediaQuery.of(context).viewInsets.bottom > 0; // ✅ Detect keyboard

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (currentPage > 0) {
              _controller.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title: Text(
          "Add a Course",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              pageSnapping: false,
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                AddCourseScreen1(
                  titleController: titleController,
                  descriptionController: descriptionController,
                  priceController: priceController,
                ),
                AddCourseScreen2(
                  categoryController: categoryController,
                  durationController: durationController,
                  lecturesController: lecturesController,
                ),
              ],
            ),
          ),

          // ✅ Hide buttons when keyboard is open
          if (!isKeyboardOpen)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (currentPage < 1) {
                        // ✅ Move to next screen
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // ✅ Submitting the course (currentPage == 1)
                        try {
                          // ✅ Validate required fields
                          if (titleController.text.isEmpty ||
                              descriptionController.text.isEmpty ||
                              priceController.text.isEmpty ||
                              categoryController.text.isEmpty ||
                              durationController.text.isEmpty ||
                              lecturesController.text.isEmpty) {
                            showSnackBar('Error', "All fields are required.");
                            return;
                          }

                          // ✅ Ensure price is a valid number
                          double? price;
                          try {
                            price = double.parse(priceController.text);
                          } catch (e) {
                            showSnackBar('Error', "Enter a valid price.");
                            return;
                          }

                          // ✅ Ensure thumbnail is selected
                          if (courseController.thumbnailPath.value.isEmpty) {
                            showSnackBar('Error', "Please select a thumbnail.");
                            return;
                          }

                          // ✅ Print debug logs before calling API
                          print("Submitting Course: ${titleController.text}");

                          // ✅ Call API to create course
                          courseController.createCourse(Course(
                            title: titleController.text,
                            teacher_id: userId,
                            description: descriptionController.text,
                            price: price,
                            category: categoryController.text,
                            certificate: courseController.isCertified.value,
                            duration: durationController.text,
                            url: courseController.thumbnailPath.value,
                            length: lecturesController.text,
                            discount: courseController.discount.value,
                          ));

                          // ✅ Show success message & navigate
                          showSnackBar('Success', "Course added successfully!");
                          Get.toNamed(RoutesNamed.addChapterScreen);
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => BottomNavBar()),
                          // );
                        } catch (e) {
                          showSnackBar('Error', "An error occurred: $e");
                          print("Error: $e");
                        }
                      }
                    },
                    child: ButtonWidget(
                      text: currentPage == 1 ? "Add" : "Next",
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
