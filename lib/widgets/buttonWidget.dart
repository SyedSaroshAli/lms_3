import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double width;

  ButtonWidget({super.key, required this.text, this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.buttonColor),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
