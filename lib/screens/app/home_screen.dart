// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lms/color/colors.dart';
// import 'package:lms/controllers/course_controller.dart';
// import 'package:lms/controllers/reviews_controller.dart';
// import 'package:lms/models/course_model.dart';
// import 'package:lms/screens/app/courseDetail_screen.dart';
// import 'package:lms/services/supabase_service.dart';
// import 'package:lms/widgets/course_tile.dart';
// import 'package:lms/widgets/filterDialogue_widget.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CourseController controller = Get.put(CourseController());
//     final SupabaseService supabaseService = Get.put(SupabaseService());
//     final ReviewsController reviewsController = Get.put(ReviewsController());

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: NestedScrollView(
//         headerSliverBuilder: (context, innerBoxIsScrolled) {
//           return [
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 15, top: 45),
//                 child: Column(
//                   children: [
//                     // Welcome Row
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               "Welcome, ",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "Sarosh",
//                               style: TextStyle(
//                                   color: AppColors.buttonColor,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Image.asset(
//                               "assets/Gear.png",
//                               height: 30,
//                             ),
//                             SizedBox(width: 5),
//                             Image.asset(
//                               "assets/Doorbell.png",
//                               height: 30,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 12),

//                     // Search Box
//                     Container(
//                       height: 50,
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(14),
//                         border: Border.all(color: Colors.grey.shade400),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.search,
//                             color: Colors.grey.shade400,
//                           ),
//                           SizedBox(width: 8),
//                           Expanded(
//                               child: TextField(
//                             cursorColor: AppColors.buttonColor,
//                             onChanged: (value) =>
//                                 controller.searchCourses(value),
//                             decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.only(bottom: 16),
//                                 enabledBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide.none),
//                                 focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide.none),
//                                 errorBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide.none)),
//                           )),
//                           SizedBox(
//                             width: 4,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Get.dialog(
//                                 FilterDialog(controller: controller),
//                               );
//                             },
//                             child: Icon(
//                               Icons.filter_list_alt,
//                               color: Colors.grey.shade400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Add space to push categories down
//                   ],
//                 ),
//               ),
//             ),

//             // Sticky Categories Section
//             SliverPersistentHeader(
//               pinned: true,
//               floating: false,
//               delegate: _StickyCategories(controller.categories),
//             ),
//           ];
//         },
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 20),

//               // Continue Watching Text
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Courses",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                   Text(
//                     "See All",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16,
//                         color: Colors.grey.shade400),
//                   )
//                 ],
//               ),

//               SizedBox(height: 10),

//               Obx(() {
//                 if (controller.filteredCourses.isNotEmpty) {
//                   return Expanded(
//                     child: GridView.builder(
//                       padding: EdgeInsets.only(bottom: 20),
//                       itemCount: controller.filteredCourses.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisSpacing: 9,
//                         mainAxisSpacing: 10,
//                         childAspectRatio: 0.70,
//                         crossAxisCount: 2,
//                       ),
//                       itemBuilder: (context, index) {
//                         var course = controller.filteredCourses[index];
//                         return GestureDetector(
//                           onTap: () {
//                             reviewsController.fetchReviews(course["id"]);
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => CourseDetailScreen(
//                                           teacher_id: course['teacher_id'],
//                                           course_id: course["id"],
//                                           description: course['description'],
//                                           title: course['title'],
//                                           price: course['price'],
//                                           length: course['length'],
//                                           discount: course['discount'],
//                                           duration: course['duration'],
//                                           imageurl: course['url'],
//                                           certificate: course['certificate'],
//                                         )));
//                           },
//                           child: CourseTile(
//                             title: course['title'],
//                             length: course['length'],
//                             teacherName: 'hello',
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               })

//               // Scrollable Grid
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Sticky Header Delegate for Categories
// class _StickyCategories extends SliverPersistentHeaderDelegate {
//   final List<String> categories;
//   final CourseController controller = Get.find<CourseController>();
//   _StickyCategories(this.categories);

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.symmetric(horizontal: 15), // Keep left-right padding
//       child: SizedBox.expand(
//         // Ensures the height matches minExtent and maxExtent
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: categories.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding:
//                   const EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 4),
//               child: GestureDetector(
//                 onTap: () {
//                   controller.selectedCourse.value = categories[index];
//                   controller.fetchCourses();
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey.shade400),
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                   child: Center(
//                     child: Text(
//                       categories[index],
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   double get maxExtent => 65; // Adjusted to match container height
//   @override
//   double get minExtent => 65; // Should match maxExtent for sticky effect
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
//       true;
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/course_controller.dart';
import 'package:lms/controllers/home_controller.dart';
import 'package:lms/routes/routes_named.dart';
import 'package:lms/widgets/popularCoursesName_tile.dart';
import 'package:lms/widgets/popularCourses_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  final CourseController courseController = CourseController();
  final HomeController homeController = Get.put(HomeController());
  final ScrollController scrollController = ScrollController();

  final CarouselController controller = CarouselController(); // This is correct
  final List containers = [
    Container(
      height: 180,
      width: 360,
      color: Colors.blue,
    ),
    Container(
      height: 180,
      width: 360,
      color: Colors.red,
    ),
    Container(
      height: 180,
      width: 360,
      color: Colors.pink,
    )
  ];
  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      homeController.updateScrollPosition(scrollController.offset);
    });

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi, Alex",
                                    style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                  Text(
                                    'What would you like to learn Today? \nSearch Below',
                                    style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: Color(0xff545454)),
                                  )
                                ],
                              ),
                              Image.asset(
                                'assets/notifications2.png',
                                height: 40,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Container(
                            height: 64,
                            margin: EdgeInsets.symmetric(vertical: 6),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(15), // Slight rounding
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.1), // Light shadow color
                                  spreadRadius: 1,
                                  blurRadius: 10, // Smooth blur
                                  offset: Offset(-5, 5), // Left shadow
                                ),
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.1), // Light shadow color
                                  spreadRadius: 1,
                                  blurRadius: 10, // Smooth blur
                                  offset: Offset(5, 5), // Right shadow
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/search.png",
                                  height: 20, // Ensure proper height
                                  width: 20,
                                  fit: BoxFit.contain,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: GestureDetector(
                                        onTap: () => Get.toNamed(
                                            RoutesNamed.searchScreen),
                                        child: Text(
                                          "Search for..",
                                          style: GoogleFonts.mulish(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        )),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color: AppColors.buttonColor),
                                  child: Center(
                                    child: Image.asset('assets/filter.png'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ])),

                SizedBox(
                  height: 20,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CarouselSlider.builder(
                        itemCount: containers.length,
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          onPageChanged: (index, reason) {
                            courseController.currentIndex.value = index;
                          },
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: containers[index]);
                        },
                      ),
                      const SizedBox(height: 16),
                      Obx(() {
                        return AnimatedSmoothIndicator(
                          activeIndex: courseController.currentIndex.value,
                          count: containers.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: Colors.blue,
                            dotColor: Colors.grey.shade400,
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                          // onDotClicked: (index) {
                          //   _controller.animateToPage(index);
                          // },
                        );
                      })
                    ]),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categories",
                            style: GoogleFonts.jost(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesNamed.categoryScreen);
                            },
                            child: Row(
                              children: [
                                Text(
                                  "SEE ALL  ",
                                  style: GoogleFonts.mulish(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.buttonColor),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.buttonColor,
                                  size: 13,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "3D Design",
                            style: GoogleFonts.mulish(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.hintColor),
                          ),
                          Text(
                            "Arts & Humanities",
                            style: GoogleFonts.mulish(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.buttonColor),
                          ),
                          Text(
                            "Graphic Design",
                            style: GoogleFonts.mulish(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.hintColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Courses",
                            style: GoogleFonts.jost(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                "SEE ALL  ",
                                style: GoogleFonts.mulish(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.buttonColor),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.buttonColor,
                                size: 13,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                // Space between slider and indicators
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        padding: EdgeInsets.only(right: 10),
                        itemCount: homeController.popularCourses.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return PopularCoursesNameTile(
                              name: homeController.popularCourses[index]);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Obx(() => AnimatedContainer(
                          decoration: BoxDecoration(),
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.only(
                              left: homeController.isScrolled.value ? 0 : 10),
                          height: 240,
                          child: ListView.builder(
                            padding: EdgeInsets.only(right: 10),
                            controller: scrollController,
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return PopularCoursesWidget();
                            },
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Mentor",
                            style: GoogleFonts.jost(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                "SEE ALL  ",
                                style: GoogleFonts.mulish(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.buttonColor),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.buttonColor,
                                size: 13,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                            padding: EdgeInsets.only(right: 10),
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width:
                                    70, // Ensuring the Container has a fixed width
                                height: 80,
                                margin: EdgeInsets.only(right: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Centers content vertically
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center, // Centers horizontally
                                  children: [
                                    Container(
                                      height: 65,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Alex",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.jost(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
