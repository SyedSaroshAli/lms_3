import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/widgets/buttonWidget.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "My courses",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(bottom: 20),
          itemCount: 30,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("name"),
            );
          }),
      floatingActionButton: Container(
        margin: EdgeInsets.only(
            top: context.height / 1.18, left: context.width / 1.8),
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Center(
          child: Text(
            'Add a Course',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
