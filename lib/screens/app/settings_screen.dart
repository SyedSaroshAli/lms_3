import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/widgets/settings_widget.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 85),
                  margin: EdgeInsets.only(top: 60),
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.containerColor,
                      border: Border.all(color: AppColors.buttonColor)),
                  child: SettingsWidget(),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 50,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
