import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/screens/app/getEnroll_screen2.dart';
import 'package:lms/widgets/buttonWidget.dart';

class OverviewScreen extends StatefulWidget {
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  int _currentStep = 0;

  void _goToNextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });

      if (_currentStep == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentMethodScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Steps Indicator
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColors.containerColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.buttonColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                bool isActive = index == _currentStep;
                bool isCompleted = index < _currentStep;

                return Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              isActive ? AppColors.buttonColor : Colors.black,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          [
                            'Overview',
                            'Payment Method',
                            'Confirmation'
                          ][index], // Step Titles
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    if (index != 2) // Step line
                      Container(
                        width: 30,
                        height: 4,
                        color:
                            isCompleted ? AppColors.buttonColor : Colors.black,
                      ),
                  ],
                );
              }),
            ),
          ),

          // Course Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Overview",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Course Name: Graphic Design",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.buttonColor)),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/Book.png",
                                  height: 30,
                                ),
                                SizedBox(width: 5),
                                Text("80+ Lectures")
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/Clock.png",
                                  height: 30,
                                ),
                                SizedBox(width: 5),
                                Text("8 Weeks")
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/Certificate.png",
                                  height: 30,
                                ),
                                SizedBox(width: 5),
                                Text("Certificate")
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/discount.png",
                                  height: 30,
                                ),
                                SizedBox(width: 5),
                                Text("10% Off")
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Course Rating :',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: List.generate(5, (starIndex) {
                          return Icon(
                            Icons.star,
                            size: 18,
                            color: AppColors.buttonColor,
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Course Time :',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "8 Weeks",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Course Trainer :',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Syed Hasnain",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      color: const Color.fromARGB(130, 238, 238, 238),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Purchase Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date: ${DateFormat('dd/MM/y').format(DateTime.now())}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                const Text(
                                  "Coupon: 10% Off",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Price: 7\$",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                const Text(
                                  "Final Price: 65\$",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Continue Button
          Padding(
            padding: EdgeInsets.only(
                right: width / 16, left: width / 16, bottom: height / 25),
            child: GestureDetector(
              onTap: () {
                _goToNextStep();
              },
              child: ButtonWidget(
                text: "Continue",
              ),
            ),
          )
        ],
      ),
    );
  }
}
