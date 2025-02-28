import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/screens/app/home_screen.dart';
import 'package:lms/screens/app/paymentConfirmation_screen.dart';
import 'package:lms/widgets/buttonWidget.dart';
import 'package:lms/widgets/paymentMethod_tile.dart';

class TransactionCompleteScreen extends StatefulWidget {
  @override
  _TransactionCompleteScreenState createState() =>
      _TransactionCompleteScreenState();
}

class _TransactionCompleteScreenState extends State<TransactionCompleteScreen> {
  int _currentStep = 2;
  int selectedIndex = -1; // Initially no selection
  int paymentDetails = -1;
  int index = -1;

  final List<String> paymentMethods = [
    "EasyPaisa",
    "Add Credit Card",
    "JazzCash"
  ];

  void _goToNextStep() {
    if (selectedIndex == -1) {
      // Agar koi option select nahi kiya to error show kare
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a payment method!")),
      );
      return;
    }

    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });

      if (_currentStep == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Steps Indicator
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.containerColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.buttonColor),
            ),
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
          SizedBox(
            height: height / 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 16, right: width / 25),
            child: Image.asset(
              'assets/transactionComplete.png',
              height: 300,
            ),
          ),
          Spacer(),
          // Continue Button
          Padding(
            padding: EdgeInsets.only(
                right: width / 16, left: width / 16, bottom: height / 25),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
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
