import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        border: Border.all(color: AppColors.buttonColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Muhammad Arsalan",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Text(
                    "Student",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: List.generate(
                  5,
                  (starIndex) => Icon(
                    Icons.star,
                    size: 16,
                    color: AppColors.buttonColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
              "Lorenfesfadvmsdpfoescsddscascscesvcscvsdlomvomvomomvomdomvomdomomdmvomdomom ofmsom ofmso mfos mvom domv omvdom vdom vdom vd")
        ],
      ),
    );
  }
}
