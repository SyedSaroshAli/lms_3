import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/screens/app/paymentConfirmation_screen.dart';
import 'package:lms/widgets/buttonWidget.dart';
import 'package:lms/widgets/paymentMethod_tile.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _currentStep = 1;
  int selectedIndex = -1; // Initially no selection
  int paymentDetails = -1;

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

    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });

      if (_currentStep == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentconfirmationScreen()),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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

          // Course Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select Payment Method ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(height: 5),

                  // Payment Methods List
                  Expanded(
                    child: ListView.builder(
                      itemCount: paymentMethods.length,
                      itemBuilder: (context, index) {
                        return SelectableContainer(
                          text: paymentMethods[index],
                          isSelected: selectedIndex == index,
                          onTap: () {
                            setState(() {
                              selectedIndex = index; // Change selected index
                              paymentDetails = index;
                            });
                          },
                        );
                      },
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
                setState(() {});
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
