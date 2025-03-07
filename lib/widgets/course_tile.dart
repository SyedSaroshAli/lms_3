import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class CourseTile extends StatelessWidget {
  final String title;
  final String length;
  final String teacherName;
  const CourseTile(
      {super.key,
      required this.title,
      required this.length,
      required this.teacherName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/videoThumbnail.png',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (starIndex) => Icon(
                          Icons.star,
                          size: 10,
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  'By $teacherName',
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 5),

                // Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: LinearProgressIndicator(
                    value: 0.45,
                    backgroundColor: Colors.grey.shade300,
                    color: AppColors.buttonColor,
                    minHeight: 6,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "45% Done",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
