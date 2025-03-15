import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/color/colors.dart';

class PopularCoursesWidget extends StatelessWidget {
  const PopularCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 240,
      margin: EdgeInsets.symmetric(
          horizontal: 12, vertical: 6), // Margin for spacing
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04), // Very light shadow
            spreadRadius: 0.5, // Tiny spread to keep it subtle
            blurRadius: 4, // Soft, gentle blur
            offset: Offset(-2, 2), // Small offset for depth
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04), // Matching light shadow
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: Offset(2, 2), // Balanced effect on both sides
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 134,
            width: 280,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                'assets/courseImage.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Graphic Design",
                      style: GoogleFonts.mulish(
                        color: Color(0xFFFF6B00),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.bookmark_outline_rounded,
                      color: AppColors.greenColor,
                      size: 20,
                    )
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Graphic Design Advanced",
                  style: GoogleFonts.jost(
                    color: Color(0xFF202244),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
