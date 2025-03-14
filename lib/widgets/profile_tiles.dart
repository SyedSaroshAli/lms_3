import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/color/colors.dart';

class ProfileTiles extends StatelessWidget {
  final String text, imageAsset;
  const ProfileTiles({super.key, required this.text, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(
            imageAsset,
            height: 20,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            text,
            style:
                GoogleFonts.mulish(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Spacer(),
          text == "Language"
              ? Text(
                  "English(US)",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w900,
                      color: AppColors.buttonColor),
                )
              : Text(''),
          SizedBox(
            width: 3,
          ),
          Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
