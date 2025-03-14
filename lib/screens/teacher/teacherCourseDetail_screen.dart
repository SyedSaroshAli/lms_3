// import 'package:flutter/material.dart';
// import 'package:lms/color/colors.dart';
// import 'package:lms/screens/courseDetailTabScreens/lessons_tab.dart';
// import 'package:lms/screens/courseDetailTabScreens/overview_tab.dart';
// import 'package:lms/screens/courseDetailTabScreens/reviews_tab.dart';

// class TeacherCourseDetailScreen extends StatelessWidget {
//   final String title, description, length, duration, imageurl;
//   final double price, discount;
//   final bool certificate;

//   const TeacherCourseDetailScreen(
//       {super.key,
//       required this.title,
//       required this.description,
//       required this.price,
//       required this.length,
//       required this.duration,
//       required this.discount,
//       required this.certificate,
//       required this.imageurl});

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               // ✅ Top Stack with Image and Play Icon
//               Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 210,
//                     child: Image.network(
//                       imageurl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 210,
//                     decoration: BoxDecoration(color: Colors.black54),
//                   ),
//                   Positioned(
//                     top: 20,
//                     left: 10,
//                     right: 10,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Icon(Icons.arrow_back, color: Colors.white),
//                         Icon(Icons.bookmark, color: Colors.white),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: height / 10,
//                     left: width / 2.5,
//                     child: Icon(
//                       Icons.play_circle_fill_outlined,
//                       size: 60,
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),

//               TabBar(
//                 indicatorColor: AppColors.buttonColor,
//                 labelColor: AppColors.buttonColor,
//                 unselectedLabelColor: Colors.grey,
//                 tabs: [
//                   Tab(text: "Overview"),
//                   Tab(text: "Lessons"),
//                   Tab(text: "Reviews"),
//                   Tab(
//                     text: "Enrolled",
//                   )
//                 ],
//               ),

//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     OverviewTab(
//                       title: title,
//                       price: price,
//                       description: description,
//                       length: length,
//                       certificate: certificate,
//                       duration: duration,
//                       discount: discount,
//                     ),
//                     LessonsTab(),
//                     ReviewsTab()
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: Padding(
//           padding: EdgeInsets.only(bottom: 30),
//           child: SizedBox(
//             width: 180,
//             height: 50,
//             child: FloatingActionButton(
//               onPressed: () {},
//               backgroundColor: AppColors.buttonColor,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18)),
//               child: Text(
//                 "GET ENROLL",
//                 style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // 🔹 Reusable Widget for Tab Content
//   Widget _buildTabContent(String text) {
//     return Center(
//       child: Text(text,
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/screens/courseDetailTabScreens/lessons_tab.dart';
import 'package:lms/screens/courseDetailTabScreens/overview_tab.dart';
import 'package:lms/screens/courseDetailTabScreens/reviews_tab.dart';
import 'package:lms/screens/courseDetailTabScreens/teacher_enrolled_tab.dart';

class TeacherCourseDetailScreen extends StatelessWidget {
  final String title, description, length, duration, imageurl, course_id;
  final double price, discount;
  final bool certificate;

  const TeacherCourseDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.length,
    required this.duration,
    required this.discount,
    required this.certificate,
    required this.imageurl,
    required this.course_id,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 210, // Set height for the image
                  floating: false,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            imageurl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(100, 0, 0, 0)),
                        ),
                        Positioned(
                          top: 20,
                          left: 10,
                          right: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.arrow_back, color: Colors.white),
                              Icon(Icons.bookmark, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      indicatorColor: AppColors.buttonColor,
                      labelColor: AppColors.buttonColor,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Overview"),
                        Tab(text: "Lessons"),
                        Tab(text: "Reviews"),
                        Tab(text: "Enrolled"),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                OverviewTab(
                  title: title,
                  price: price,
                  description: description,
                  length: length,
                  certificate: certificate,
                  duration: duration,
                  discount: discount,
                ),
                LessonsTab(),
                ReviewsTab(
                  course_id: course_id,
                ),
                EnrollementTab(course_id: course_id)
              ],
            ),
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: Padding(
        //   padding: EdgeInsets.only(bottom: 30),
        //   child: SizedBox(
        //     width: 180,
        //     height: 50,
        //     child: FloatingActionButton(
        //       onPressed: () {},
        //       backgroundColor: AppColors.buttonColor,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(18),
        //       ),
        //       child: Text(
        //         "GET ENROLL",
        //         style: TextStyle(
        //           fontSize: 14,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        // ),
        // ),
      ),
    );
  }

  Widget _buildTabContent(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height + 10; // Added padding
  @override
  double get maxExtent => _tabBar.preferredSize.height + 10;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10), // Adds padding before sticking
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
