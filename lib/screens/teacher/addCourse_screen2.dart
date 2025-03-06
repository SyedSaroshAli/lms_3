import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/course_controller.dart';
import 'package:lms/widgets/buttonWidget.dart';

class AddCourseScreen2 extends StatelessWidget {
  final TextEditingController categoryController;
  final TextEditingController durationController;
  final TextEditingController lecturesController;

  AddCourseScreen2({
    super.key,
    required this.categoryController,
    required this.durationController,
    required this.lecturesController,
  });

  final CourseController courseController = Get.find<CourseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title

              SizedBox(
                height: 10,
              ),
              // Title
              Text(
                "Course Category",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.containerColor,
                ),
                child: TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Enter the category of your course",
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Text(
                "Duration",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.containerColor,
                ),
                child: TextField(
                  controller: durationController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Duration of course",
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Text(
                "No of lectures",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.containerColor,
                ),
                child: TextField(
                  controller: lecturesController,
                  decoration: InputDecoration(
                    suffixText: "%",
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Duration of course",
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),

              // Description

              SizedBox(height: 14),
              Text(
                "Select discount on your course",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              // Price Row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() {
                    return Text(
                      '${courseController.discount.value.toString()}%',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.buttonColor),
                    );
                  })
                ],
              ),
              Obx(() {
                return FlutterSlider(
                  values: [courseController.discount.value],
                  max: 100,
                  min: 0,
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    courseController.discount.value = lowerValue;
                  },
                  trackBar: FlutterSliderTrackBar(
                    activeTrackBarHeight: 5,
                    inactiveTrackBarHeight: 5,
                    activeTrackBar: BoxDecoration(color: AppColors.buttonColor),
                  ),
                  handler: FlutterSliderHandler(
                    child: Icon(Icons.discount, color: Colors.white),
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),

              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Is this course certified?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Obx(() {
                    return Checkbox(
                        activeColor: AppColors.buttonColor,
                        value: courseController.isCertified.value,
                        onChanged: (value) {
                          courseController.isCertified.value = value!;
                        });
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
