import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularCoursesNameTile extends StatelessWidget {
  final String name;
  const PopularCoursesNameTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFFE8F1FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          name,
          style: GoogleFonts.mulish(
            color: Color(0xFF0A1C2B),
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
