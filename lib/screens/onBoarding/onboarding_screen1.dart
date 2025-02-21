import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 50),
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Image.asset(
                "assets/onboarding1.png",
                height: 250,
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Welcome to Cybex IT Group where learning meets innovation!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Empowering your journey through cutting-edge IT education and expertise",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
