import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:lms/widgets/image_circle.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final SupabaseService controller = Get.put(SupabaseService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                print(controller.userData);
              },
              child: Icon(Icons.edit)),
          SizedBox(
            width: 15,
          )
        ],
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
                  padding:
                      EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 30),
                  margin: EdgeInsets.only(top: 60),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.containerColor,
                      border: Border.all(color: AppColors.buttonColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Obx(() {
                                return controller.userData['full_name'] != null
                                    ? Text(
                                        controller.userData['full_name'],
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : CircularProgressIndicator();
                              }),
                              Text(
                                "Sarosh",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'About Me',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Obx(() {
                        return controller.userData['bio'] != null
                            ? Text(
                                controller.userData['bio'],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade600),
                              )
                            : Text(
                                'Tell about yourself',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500),
                              );
                      }),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "My Skills",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: GridView.builder(
                          shrinkWrap:
                              true, // Allows it to take only the necessary space
                          physics:
                              NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
                          itemCount: controller.userData['skills']
                              .length, // Change dynamically as needed
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 9,
                            crossAxisSpacing: 9,
                            childAspectRatio: 3.5,
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.hintColor),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Center(
                                child:
                                    Text(controller.userData['skills'][index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: 10,
                    child: CircleImage(
                      radius: 50,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
