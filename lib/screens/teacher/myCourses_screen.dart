import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/course_controller.dart';
import 'package:lms/controllers/enrollment_controller.dart';
import 'package:lms/controllers/reviews_controller.dart';
import 'package:lms/models/course_model.dart';
import 'package:lms/routes/routes_named.dart';
import 'package:lms/screens/teacher/teacherCourseDetail_screen.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:lms/widgets/teacherCourse_tile.dart';

class TeacherCoursesScreen extends StatelessWidget {
  TeacherCoursesScreen({super.key});
  final CourseController controller = Get.put(CourseController());
  final SupabaseService supabaseController = Get.find<SupabaseService>();
  final ReviewsController reviewsController = Get.find<ReviewsController>();
  final EnrollmentsController enrollmentsController =
      Get.find<EnrollmentsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "My courses",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: Obx(() {
          if (controller.fetchedTeacherCourses.isEmpty) {
            return Center(
                child: CircularProgressIndicator()); // Show loading spinner
          }
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 0.65,
            ),
            itemCount: controller.fetchedTeacherCourses.length,
            itemBuilder: (context, index) {
              final course = controller.fetchedTeacherCourses[index];
              return GestureDetector(
                onTap: () {
                  enrollmentsController.fetchEnrollments(course["id"]);
                  reviewsController.fetchReviews(course["id"]);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TeacherCourseDetailScreen(
                                title: course['title'],
                                description: course['description'],
                                price: course['price'],
                                length: course['length'],
                                duration: course['duration'],
                                discount: course['discount'],
                                certificate: course['certificate'],
                                imageurl: course['url'],
                                course_id: course['id'],
                              )));
                },
                child: TeacherCourseTile(
                  title: course['title'] ?? 'No Title',
                  length: course['length'] ?? 'Unknown',
                ),
              );
              // : CircularProgressIndicator();
            },
          );
        }),
        floatingActionButton: GestureDetector(
          onTap: () {
            Get.toNamed(RoutesNamed.addCourseScreen);
          },
          child: Container(
            margin: EdgeInsets.only(
                top: context.height / 1.18, left: context.width / 1.8),
            decoration: BoxDecoration(
                color: AppColors.buttonColor,
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: Center(
              child: Text(
                'Add a Course',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
          ),
        ));
  }
}
