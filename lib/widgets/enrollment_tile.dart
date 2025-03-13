import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class EnrollmentTile extends StatelessWidget {
  const EnrollmentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade400,
            width: 1.1,
          ),
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 30,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sarosh',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Text(
                    "Student",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.person_outline_rounded,
            size: 20,
            color: AppColors.buttonColor,
          ),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.chat_bubble_outline,
            size: 20,
            color: AppColors.buttonColor,
          )
        ],
      ),
    );
  }
}
