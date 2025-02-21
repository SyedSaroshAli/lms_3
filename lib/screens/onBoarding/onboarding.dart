// import 'package:flutter/material.dart';
// import 'package:lms/screens/onBoarding/onboarding_screen1.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _controller = PageController();
//   int currentPage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView(
//               controller: _controller,
//               onPageChanged: (index) {
//                 setState(() {
//                   currentPage = index;
//                 });
//               },
//               children: [
//                 OnboardingScreen1(),
//               ],
//             ),
//           ),
//           SmoothPageIndicator(
//             controller: _controller,
//             count: 3,
//             effect: ExpandingDotsEffect(
//               activeDotColor: Colors.blue,
//               dotHeight: 10,
//               dotWidth: 10,
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: ElevatedButton(
//               onPressed: () {
//                 if (currentPage < 2) {
//                   _controller.nextPage(
//                     duration: Duration(milliseconds: 500),
//                     curve: Curves.easeInOut,
//                   );
//                 } else {
//                   // Navigate to Home or another screen
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 15),
//                 textStyle: TextStyle(fontSize: 18),
//                 backgroundColor: Colors.blue,
//               ),
//               child: Text(currentPage == 2 ? "Get Started" : "Next"),
//             ),
//           ),
//           SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/screens/onBoarding/onboarding_screen1.dart';
import 'package:lms/screens/onBoarding/onboarding_screen2.dart';
import 'package:lms/screens/onBoarding/onboarding_screen3.dart';
import 'package:lms/screens/onBoarding/onboarding_screen4.dart';
import 'package:lms/screens/onBoarding/onboarding_screen5.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                OnboardingScreen1(),
                OnboardingScreen2(),
                OnboardingScreen3(),
                OnboardingScreen4()
              ],
            ),
          ),

          // Reduced space above the indicator

          // Smooth Page Indicator
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.buttonColor,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),

          // Increased space below the indicator
          SizedBox(height: 70),

          // Next Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                if (currentPage < 3) {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnboardingScreen5()));
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: AppColors.buttonColor),
              child: Text(
                currentPage == 3 ? "Get Started" : "CONTINUE",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          // Increased space at the bottom
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
