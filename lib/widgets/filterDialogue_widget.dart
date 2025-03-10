import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/course_controller.dart';
import 'package:lms/widgets/buttonWidget.dart';
import 'package:lms/widgets/filter_button.dart';

class FilterDialog extends StatelessWidget {
  final CourseController controller;

  const FilterDialog({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Filter Courses",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            // Filter by Date
            Text("Sort by Date", style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Obx(() {
                  return GestureDetector(
                      onTap: () {
                        controller.oldestToNew.value = true;
                        controller.newestToOldest.value = false;

                        //    controller.sortCoursesByDate(ascending: true);
                        // Get.back();
                      },
                      child: FilterButton(
                        text: 'Oldest to Newest',
                        isSelected: controller.oldestToNew.value,
                      ));
                }),
                SizedBox(width: 10),
                Obx(() {
                  return GestureDetector(
                      onTap: () {
                        controller.newestToOldest.value = true;
                        controller.oldestToNew.value = false;
                        // controller.sortCoursesByDate(ascending: false);
                        // Get.back();
                      },
                      child: FilterButton(
                        text: 'Newest to Oldest',
                        isSelected: controller.newestToOldest.value,
                      ));
                }),
              ],
            ),

            SizedBox(height: 16),

            // Filter by Price
            Text("Sort by Price",
                style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Obx(() {
                  return GestureDetector(
                      onTap: () {
                        controller.lowestToHighet.value = true;
                        controller.highestToLowest.value = false;

                        //    controller.sortCoursesByDate(ascending: true);
                        // Get.back();
                      },
                      child: FilterButton(
                        text: 'Lowest to Highest',
                        isSelected: controller.lowestToHighet.value,
                      ));
                }),
                SizedBox(width: 10),
                Obx(() {
                  return GestureDetector(
                      onTap: () {
                        controller.highestToLowest.value = true;
                        controller.lowestToHighet.value = false;
                        // controller.sortCoursesByDate(ascending: false);
                        // Get.back();
                      },
                      child: FilterButton(
                        text: 'Highest to Lowest',
                        isSelected: controller.highestToLowest.value,
                      ));
                }),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.applySorting();
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.buttonColor),
                    child: Center(
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
