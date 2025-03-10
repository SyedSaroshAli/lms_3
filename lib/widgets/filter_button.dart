import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms/color/colors.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  const FilterButton({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 113,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.transparent : AppColors.buttonColor),
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? AppColors.buttonColor : Colors.white),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: isSelected ? Colors.white : AppColors.buttonColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
