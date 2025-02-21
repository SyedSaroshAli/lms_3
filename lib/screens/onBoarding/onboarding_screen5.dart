import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class OnboardingScreen5 extends StatelessWidget {
  const OnboardingScreen5({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                      decoration: BoxDecoration(
                          color: AppColors.skipButtonColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "SKIP",
                          style: TextStyle(),
                        ),
                      ))
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 14),
              Image.asset(
                "assets/onboarding5.png",
                height: 250,
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                "Join Cybex IT Group to Kick Start Your Lesson",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "Join and Learn from our Top Instructors",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 7, vertical: height / 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.buttonColor),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 7, vertical: height / 52),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: AppColors.buttonColor, width: 1.4),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: AppColors.buttonColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
