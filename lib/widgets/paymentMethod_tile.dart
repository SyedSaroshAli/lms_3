import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class SelectableContainer extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  const SelectableContainer({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.containerColor : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10),
            // boxShadow: isSelected
            //     ? [
            //         BoxShadow(
            //           color: AppColors.containerColor.withOpacity(0.5),
            //           blurRadius: 3,
            //           spreadRadius: 0,
            //           offset: Offset(0, 3),
            //         ),
            //       ]
            //     : [],
            border: Border.all(
                color:
                    isSelected ? AppColors.buttonColor : Colors.transparent)),
        child: Row(
          children: [
            Icon(
              Icons.add_circle,
              color: isSelected ? AppColors.buttonColor : Colors.black,
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
