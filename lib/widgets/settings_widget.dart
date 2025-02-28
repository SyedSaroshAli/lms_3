import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.buttonColor;
    List<Icon> icons = [
      Icon(
        Icons.person,
        color: color,
      ),
      Icon(Icons.wallet, color: color),
      Icon(Icons.file_copy, color: color),
      Icon(Icons.headset_mic, color: color),
      Icon(Icons.share, color: color),
      Icon(Icons.logout, color: color),
    ];

    List<String> title = [
      "Edit Profile",
      "Payment Option",
      "Terms & Conditions",
      "Help Center",
      "Invite Friends",
      "Logout"
    ];
    return ListView.builder(
        itemCount: title.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              title[index],
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: icons[index],
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.buttonColor,
            ),
          );
        });
  }
}
