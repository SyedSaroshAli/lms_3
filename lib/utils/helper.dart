import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lms/color/colors.dart';

void showSnackBar(String title, String message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Color(0xff252526),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      snackStyle: SnackStyle.GROUNDED);
}
