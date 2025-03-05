import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/routes/routes_named.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:lms/utils/helper.dart';
import 'package:supabase/supabase.dart';

class CompleteProfileController extends GetxController {
  final userId = SupabaseService.client.auth.currentUser!.id;
  RxBool isLoading = false.obs;
  RxList<String> skills = <String>[].obs;
  RxString selectedRole = "Student".obs; // <-- Initialize with default value
  Rx<File?> image = Rx<File?>(null);
  void addSkill(String text) {
    if (text.isNotEmpty) {
      skills.add(text); // No need for skills.value.add()
    }
  }

  void removeSkill(String text) {
    skills.remove(text); // Function to remove a skill
  }

  void pickImage() async {
    File? file = await pickImageFromGallery();
    if (file != null) {
      image.value = file;
    }
  }

  Future<void> updateProfile() async {
    try {
      isLoading.value = true;
      var uploadedPath = '';
      if (image.value != null) {
        print("entered image function");
        final String dir = "$userId/profile.jpg";
        final String path = await SupabaseService.client.storage
            .from(SupabaseService.S3_BUCKET)
            .upload(
              dir,
              image.value!,
              fileOptions: const FileOptions(upsert: true),
            );

        uploadedPath = path;
        print("image: $path");
      }
      print({
        'role': selectedRole.value,
        'skills': skills.toList(),
      });
      final response = await SupabaseService.client
          .from('user')
          .update({
            'image': uploadedPath,
            'role': selectedRole.value,
            'skills': skills.toList()
          })
          .eq('id', userId)
          .select('*'); // Update only the logged-in user
      print({
        'role': selectedRole.value,
        'skills': skills.toList(),
      });
      print('user_id: $userId');
      print('updated successfully: $response');
      showSnackBar('Success', 'Profile updated successfully');
      Get.offAllNamed(RoutesNamed.bottomNavBar);
    } on StorageException catch (e) {
      isLoading.value = false;
      showSnackBar('Error', e.message);
    }
  }
}
