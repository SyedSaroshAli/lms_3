import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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

// Function to pick a video file
Future<File?> pickVideoFromGallery() async {
  final ImagePicker picker = ImagePicker();
  final XFile? file = await picker.pickVideo(source: ImageSource.gallery);
  if (file == null) return null;
  return File(file.path);
}

// Function to upload video to Supabase Storage
Future<String?> uploadVideoToSupabase(File videoFile) async {
  final supabase = Supabase.instance.client;
  const uuid = Uuid();
  final filePath =
      "${SupabaseService.S3_BUCKET}/videos/${uuid.v4()}.mp4"; // Unique file path in storage

  try {
    await supabase.storage
        .from(SupabaseService.S3_BUCKET)
        .upload(filePath, videoFile);
    final publicUrl = getS3Url(filePath);
    return publicUrl;
  } catch (error) {
    showSnackBar('Upload Failed', error.toString());
    return null;
  }
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
