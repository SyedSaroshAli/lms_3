import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/color/colors.dart';
import 'package:uuid/uuid.dart';

void showSnackBar(String title, String message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Color(0xff252526),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      snackStyle: SnackStyle.GROUNDED);
}

Future<File?> pickImageFromGallery() async {
  const uuid = Uuid();
  final ImagePicker picker = ImagePicker();
  final XFile? file = await picker.pickImage(source: ImageSource.gallery);
  if (file == null) return null;
  final dir = Directory.systemTemp;
  final targetPath = "${dir.absolute.path}/${uuid.v6()}.jpg";
  File image = await compressImage(File(file.path), targetPath);
  return image;
}

//Compress image file
Future<File> compressImage(File file, String targetPath) async {
  var result = await FlutterImageCompress.compressAndGetFile(
      file.path, targetPath,
      quality: 70);
  return File(result!.path);
}

String getS3Url(String path) {
  return "https://gpmouvocgqptokxftenk.supabase.co/storage/v1/object/public/$path";
}
