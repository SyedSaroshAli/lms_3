import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/routes/routes_named.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:lms/utils/helper.dart';
import 'package:lms/widgets/profile_tiles.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final SupabaseService supabaseController = Get.find<SupabaseService>();
    List text = [
      "Edit Profile",
      "Payment Options",
      "Notifications",
      "Security",
      "Language",
      "Dark Mode",
      "Terms & Conditions",
      "Help Center",
      "Invite Friends"
    ];
    List imageAssets = [
      "assets/user.png",
      "assets/wallet.png",
      "assets/notifications.png",
      "assets/security.png",
      "assets/language.png",
      "assets/darkMode.png",
      "assets/terms.png",
      "assets/help.png",
      "assets/inviteFriends.png"
    ];

    List routes = [RoutesNamed.editProfileScreen];
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.mulish(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Elevated Container with Shadow
            Container(
              margin: EdgeInsets.only(top: 50),
              height: height / 1.4,
              width: width / 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Slight rounding
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
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Alex",
                      style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w800, fontSize: 24),
                    ),
                    Text(
                      "saroshali@gmail.com",
                      style: GoogleFonts.mulish(
                          fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          itemCount: text.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(RoutesNamed.editProfileScreen);
                              },
                              child: ProfileTiles(
                                text: text[index],
                                imageAsset: imageAssets[index],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),

            // Profile Avatar Stack
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  // Outer Green Border
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xff167F71),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: CircleAvatar(
                      backgroundImage: supabaseController.userData["image"] !=
                              null
                          ? NetworkImage(
                              getS3Url(supabaseController.userData["image"]))
                          : AssetImage("assets/user_image.jpg"),
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
            ),
          ],
        ),
      ),
    );
  }
}
