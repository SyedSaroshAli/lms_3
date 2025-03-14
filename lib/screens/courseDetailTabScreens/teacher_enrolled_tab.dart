import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/controllers/enrollment_controller.dart';
import 'package:lms/widgets/enrollment_tile.dart';

class EnrollementTab extends StatelessWidget {
  final String course_id;
  EnrollementTab({super.key, required this.course_id});

  final EnrollmentsController enrollmentsController =
      Get.find<EnrollmentsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: enrollmentsController
            .fetchedEnrollments.length, // Change the count as needed
        itemBuilder: (context, index) {
          print(course_id);
          // print(enrollmentsController.fetchedEnrollments[index]["course_id"]);
          // return enrollmentsController.fetchedEnrollments[index]["course_id"] ==
          //         course_id?
          return EnrollmentTile(
              // name: enrollmentsController.fetchedEnrollments[index]['user']
              //     ['full_name'],
              // imageUrl: enrollmentsController.fetchedEnrollments[index]['user']
              //     ['image'],
              // id: enrollmentsController.fetchedEnrollments[index]['student_id'],
              );
          // : null;
        },
      );
    });
  }
}
