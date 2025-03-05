import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/completeProfile_controller.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:lms/widgets/buttonWidget.dart';
import 'package:lms/widgets/image_circle.dart';

class CompleteProfileScreen extends StatefulWidget {
  CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final CompleteProfileController controller =
      Get.put(CompleteProfileController());

  final TextEditingController skillsController = TextEditingController();

  final List<String> roles = ["Student", "Teacher"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Complete Profile",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleImage(
                        radius: 60,
                        file: controller.image.value,
                      ),
                      Positioned(
                        bottom: 0,
                        right: -1,
                        child: GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColors.buttonColor,
                            radius: 16,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                })
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Select Your Role",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Obx(() {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: controller.selectedRole.value,
                      items: roles.map((String role) {
                        return DropdownMenuItem(value: role, child: Text(role));
                      }).toList(),
                      onChanged: (newValue) {
                        controller.selectedRole.value = newValue!;
                      },
                    ),
                  );
                })),
            SizedBox(height: 15),
            Text(
              "Add your Skills",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: skillsController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Enter your skill",
                        focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      String text = skillsController.text.trim();
                      if (text.isNotEmpty) {
                        controller.addSkill(text);
                        skillsController
                            .clear(); // **Clear the input field after adding**
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.buttonColor,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Obx(() {
              return Wrap(
                spacing: 8,
                children: controller.skills.map((skill) {
                  return Chip(
                    label: Text(skill),
                    onDeleted: () {
                      controller.removeSkill(skill);
                    },
                    deleteIcon: Icon(Icons.close, size: 18),
                  );
                }).toList(),
              );
            }),
            Spacer(),
            GestureDetector(
                onTap: () {
                  controller.updateProfile();
                },
                child: ButtonWidget(text: 'Submit')),
            SizedBox(
              height: context.height / 12,
            )
          ],
        ),
      ),
    );
  }
}
