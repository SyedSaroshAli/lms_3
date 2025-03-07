// import 'package:flutter/material.dart';
// import 'package:lms/color/colors.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> categories = ["UI/UX", "Graphic Design", "Figma"];
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.only(left: 15, right: 15, top: 45),
//         child: Column(
//           mainAxisSize: MainAxisSize.min, // Prevents taking unnecessary space
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "Welcome, ",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       "Sarosh",
//                       style: TextStyle(
//                           color: AppColors.buttonColor,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Image.asset(
//                       "assets/Gear.png",
//                       height: 30,
//                     ),
//                     SizedBox(width: 5),
//                     Image.asset(
//                       "assets/Doorbell.png",
//                       height: 30,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 12),
//             Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(color: Colors.grey.shade400)),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.search,
//                     color: Colors.grey.shade400,
//                   ),
//                   SizedBox(width: 8),
//                   Text(
//                     "Search...",
//                     style: TextStyle(color: Colors.grey.shade500),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),

//             // Fixed ListView issue
//             SizedBox(
//               height: 42, // Added height to prevent layout issues
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 5), // Added spacing
//                     child: Container(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey.shade400),
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       child: Center(
//                         child: Text(
//                           categories[index],
//                           style: TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Continue Watching",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 Text(
//                   "See All",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                       color: Colors.grey.shade400),
//                 )
//               ],
//             ),
//             // Expanded(
//             //   child: GridView.builder(
//             //       scrollDirection: Axis.vertical,
//             //       physics: NeverScrollableScrollPhysics(),
//             //       itemCount: 8,
//             //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             //           crossAxisSpacing: 7,
//             //           childAspectRatio: 0.7,
//             //           crossAxisCount: 2),
//             //       itemBuilder: (context, index) {
//             //         return Container(
//             //           child: Column(
//             //             crossAxisAlignment: CrossAxisAlignment.center,
//             //             children: [
//             //               Image.asset('assets/videoThumbnail.png'),
//             //               SizedBox(
//             //                 height: 5,
//             //               ),
//             //               Column(
//             //                 crossAxisAlignment: CrossAxisAlignment.start,
//             //                 children: [
//             //                   Row(
//             //                     children: [
//             //                       Text(
//             //                         "Graphic Design",
//             //                         style:
//             //                             TextStyle(fontWeight: FontWeight.w600),
//             //                       )
//             //                     ],
//             //                   ),
//             //                   Text(
//             //                     'By Syed Hasnain',
//             //                     style: TextStyle(
//             //                         color: Colors.grey.shade400,
//             //                         fontSize: 12,
//             //                         fontWeight: FontWeight.w400),
//             //                   ),
//             //                 ],
//             //               )
//             //             ],
//             //           ),
//             //         );
//             //       }),
//             // )
//             Expanded(
//               child: GridView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount: 8,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisSpacing: 9,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 0.70, // Adjusted to match the UI
//                   crossAxisCount: 2,
//                 ),
//                 itemBuilder: (context, index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 5,
//                                 spreadRadius: 2,
//                               ),
//                             ],
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(16),
//                             child: Image.asset(
//                               'assets/videoThumbnail.png',
//                               width: double.infinity,
//                               height:
//                                   120, // Adjusted height for a better layout
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Graphic Design",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12),
//                                   ),
//                                   Row(
//                                     children: List.generate(
//                                       5,
//                                       (starIndex) => Icon(
//                                         Icons.star,
//                                         size: 10,
//                                         color: AppColors.buttonColor,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 2),
//                               Text(
//                                 'By Syed Hasnain',
//                                 style: TextStyle(
//                                     color: Colors.grey.shade500,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               SizedBox(height: 5),

//                               SizedBox(height: 4),
//                               // Progress Bar
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: LinearProgressIndicator(
//                                   value: 0.45, // 45% progress
//                                   backgroundColor: Colors.grey.shade300,
//                                   color: AppColors.buttonColor,
//                                   minHeight: 6,
//                                 ),
//                               ),
//                               SizedBox(height: 3),
//                               Text(
//                                 "45% Done",
//                                 style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.grey.shade500),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/course_controller.dart';
import 'package:lms/screens/app/courseDetail_screen.dart';
import 'package:lms/widgets/course_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ["UI/UX", "Graphic Design", "Figma"];
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
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 16),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ))
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
              delegate: _StickyCategories(categories),
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
                if (controller.fetchedCourses.isNotEmpty) {
                  return Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(bottom: 20),
                      itemCount: controller.fetchedCourses.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 9,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.70,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CourseDetailScreen(
                                          description:
                                              controller.fetchedCourses[index]
                                                  ['description'],
                                          title: controller
                                              .fetchedCourses[index]['title'],
                                          price: controller
                                              .fetchedCourses[index]['price'],
                                          length: controller
                                              .fetchedCourses[index]['length'],
                                          discount:
                                              controller.fetchedCourses[index]
                                                  ['discount'],
                                          duration:
                                              controller.fetchedCourses[index]
                                                  ['duration'],
                                          imageurl: controller
                                              .fetchedCourses[index]['url'],
                                          certificate:
                                              controller.fetchedCourses[index]
                                                  ['certificate'],
                                        )));
                          },
                          child: CourseTile(
                            title: controller.fetchedCourses[index]['title'],
                            length: controller.fetchedCourses[index]['length'],
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
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
