import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class InboxButtonwidget extends StatelessWidget {
  final double width;
  final String text;
  final bool isSelected;

  const InboxButtonwidget(
      {super.key,
      required this.width,
      required this.isSelected,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 2.4,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.buttonColor : AppColors.containerColor,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: isSelected ? Colors.white : AppColors.buttonColor,
            fontWeight: FontWeight.w500,
            fontSize: 22),
      )),
    );
  }
}
