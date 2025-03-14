import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditprofileTextfield extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final Icon? icon;

  const EditprofileTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      padding: EdgeInsets.only(
        left: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15), // Slight rounding
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Light shadow color
            spreadRadius: 1,
            blurRadius: 10, // Smooth blur
            offset: Offset(-5, 5), // Left shadow
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Light shadow color
            spreadRadius: 1,
            blurRadius: 10, // Smooth blur
            offset: Offset(5, 5), // Right shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: icon,
                hintText: hintText,
                hintStyle: GoogleFonts.mulish(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                errorBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
