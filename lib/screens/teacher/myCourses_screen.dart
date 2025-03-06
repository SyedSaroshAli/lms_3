import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/course_controller.dart';
import 'package:lms/models/course_model.dart';
import 'package:lms/widgets/teacherCourse_tile.dart';

class TeacherCoursesScreen extends StatelessWidget {
  TeacherCoursesScreen({super.key});
  final CourseController controller = Get.put(CourseController());
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
        body: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 0.65),
            itemCount: 3,
            itemBuilder: (context, index) {
              return TeacherCourseTile();
            }),
        floatingActionButton: GestureDetector(
          onTap: () {
            controller.createCourse(Course(
                title: "",
                teacher_id: "63bdda63-2700-4e46-99ee-9d5b4de377c8",
                description: "description",
                price: 3.2,
                category: "category",
                certificate: true,
                duration: 'duration',
                url: 'courseImageUrl',
                length: 'length',
                discount: 3.2));
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
