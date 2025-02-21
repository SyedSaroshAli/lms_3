import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final String iconPath; // Path to icon asset

  const SocialButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
        border:
            Border.all(color: Colors.grey.shade300), // Border for Google button
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            height: 24, // Adjust icon size
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: color == Colors.white ? Colors.black : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
