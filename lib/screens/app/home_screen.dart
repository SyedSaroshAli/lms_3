import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/course_controller.dart';
import 'package:lms/models/course_model.dart';
import 'package:lms/screens/app/courseDetail_screen.dart';
import 'package:lms/widgets/course_tile.dart';
import 'package:lms/widgets/filterDialogue_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CourseController controller = Get.put(CourseController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 45),
                child: Column(
                  children: [
                    // Welcome Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Welcome, ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Sarosh",
                              style: TextStyle(
                                  color: AppColors.buttonColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/Gear.png",
                              height: 30,
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              "assets/Doorbell.png",
                              height: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    // Search Box
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                              child: TextField(
                            cursorColor: AppColors.buttonColor,
                            onChanged: (value) =>
                                controller.searchCourses(value),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 16),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                          )),
                          SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.dialog(
                                FilterDialog(controller: controller),
                              );
                            },
                            child: Icon(
                              Icons.filter_list_alt,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Add space to push categories down
                  ],
                ),
              ),
            ),

            // Sticky Categories Section
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: _StickyCategories(controller.categories),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              // Continue Watching Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Courses",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey.shade400),
                  )
                ],
              ),

              SizedBox(height: 10),

              Obx(() {
                if (controller.filteredCourses.isNotEmpty) {
                  return Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(bottom: 20),
                      itemCount: controller.filteredCourses.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 9,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.70,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        var course = controller.filteredCourses[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CourseDetailScreen(
                                          description: course['description'],
                                          title: course['title'],
                                          price: course['price'],
                                          length: course['length'],
                                          discount: course['discount'],
                                          duration: course['duration'],
                                          imageurl: course['url'],
                                          certificate: course['certificate'],
                                        )));
                          },
                          child: CourseTile(
                            title: course['title'],
                            length: course['length'],
                            teacherName: 'hello',
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })

              // Scrollable Grid
            ],
          ),
        ),
      ),
    );
  }
}

// Sticky Header Delegate for Categories
class _StickyCategories extends SliverPersistentHeaderDelegate {
  final List<String> categories;
  final CourseController controller = Get.find<CourseController>();
  _StickyCategories(this.categories);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15), // Keep left-right padding
      child: SizedBox.expand(
        // Ensures the height matches minExtent and maxExtent
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 4),
              child: GestureDetector(
                onTap: () {
                  controller.selectedCourse.value = categories[index];
                  controller.fetchCourses();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  double get maxExtent => 65; // Adjusted to match container height
  @override
  double get minExtent => 65; // Should match maxExtent for sticky effect
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
