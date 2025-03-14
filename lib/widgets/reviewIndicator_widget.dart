import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class RatingProgressIndicator extends StatelessWidget {
  final String text;
  final double value;
  const RatingProgressIndicator(
      {super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 7,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 20,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: AppColors.hintColor,
              borderRadius: BorderRadius.circular(12),
              valueColor: AlwaysStoppedAnimation(AppColors.buttonColor),
            ),
          ),
        )
      ],
    );
  }
}
