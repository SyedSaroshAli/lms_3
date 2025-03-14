import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/widgets/buttonWidget.dart';
import 'package:lms/widgets/editProfile_textfield.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController nickNameController = TextEditingController();
    final TextEditingController dateOfBrithController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    List text = ["Full name", "Nick Name", "Date of Birth", "Email"];
    List<TextEditingController> controllers = [
      fullNameController,
      nickNameController,
      dateOfBrithController,
      emailController
    ];
    List icon = [
      Icon(Icons.person_outline),
      Icon(Icons.person_outline),
      Icon(Icons.calendar_month_outlined),
      Icon(Icons.email_outlined)
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Edit Profile",
          style: GoogleFonts.mulish(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                // Outer Green Border
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xff167F71),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                  ),
                ),

                // Edit Icon at Bottom Right
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Color(0xff167F71),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: CircleAvatar(
                      radius: 16,
                      child: Icon(Icons.edit),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            for (int i = 0; i < text.length; i++)
              EditprofileTextfield(
                controller: controllers[i],
                hintText: text[i],
                icon: icon[i],
              ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ButtonWidget(text: 'Update'),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
