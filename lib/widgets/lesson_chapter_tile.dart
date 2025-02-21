import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class LessonChapterTile extends StatelessWidget {
  const LessonChapterTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(12)),
      child: Text("Chapter 1: What is Graphic Designing?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }
}
