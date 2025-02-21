// import 'package:flutter/material.dart';

// class CourseDetailScreen extends StatelessWidget {
//   const CourseDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           height: double.infinity,
//           width: double.infinity,
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                       width: double.infinity,
//                       height: 210,
//                       child: Image.asset(
//                         'assets/videoThumbnail.png',
//                         fit: BoxFit.fill,
//                       )),
//                   Container(
//                     width: double.infinity,
//                     height: 210,
//                     decoration: BoxDecoration(
//                         color: const Color.fromARGB(119, 0, 0, 0)),
//                   ),
//                   Positioned(
//                     top: 20,
//                     left: 10,
//                     right: 10,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Icon(
//                           Icons.arrow_back,
//                           color: Colors.white,
//                         ),
//                         Icon(
//                           Icons.bookmark,
//                           color: Colors.white,
//                         )
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                       top: height / 10,
//                       left: width / 5,
//                       right: width / 5,
//                       child: Icon(
//                         Icons.play_circle_fill_outlined,
//                         size: 60,
//                         color: Colors.white,
//                       ))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/screens/courseDetailTabScreens/lessons_tab.dart';
import 'package:lms/screens/courseDetailTabScreens/overview_tab.dart';
import 'package:lms/screens/courseDetailTabScreens/reviews_tab.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // ✅ Top Stack with Image and Play Icon
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 210,
                    child: Image.asset(
                      'assets/videoThumbnail.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 210,
                    decoration: BoxDecoration(color: Colors.black54),
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
                  Positioned(
                    top: height / 10,
                    left: width / 2.5,
                    child: Icon(
                      Icons.play_circle_fill_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                  )
                ],
              ),

              TabBar(
                indicatorColor: AppColors.buttonColor,
                labelColor: AppColors.buttonColor,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Overview"),
                  Tab(text: "Lessons"),
                  Tab(text: "Reviews"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [OverviewTab(), LessonsTab(), ReviewsTab()],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: SizedBox(
            width: 180,
            height: 50,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: Text(
                "GET ENROLL",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Reusable Widget for Tab Content
  Widget _buildTabContent(String text) {
    return Center(
      child: Text(text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
