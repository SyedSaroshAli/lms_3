import 'dart:io';

import 'package:get/get.dart';
import 'package:lms/models/course_model.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:lms/utils/helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseController extends GetxController {
  RxString selectedCurrency = "Dollar".obs;
  RxDouble discount = 10.0.obs;
  final userId = SupabaseService.client.auth.currentUser!.id;
  RxBool isCertified = false.obs;

  // RxList fetchedCourses = [].obs;
  RxList fetchedCourses = [].obs;

  Rx<File?> thumbnail = Rx<File?>(null);
  RxString thumbnailPath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
    print("On init called");
    // listenToAuthChanges();
  }

  //create a course
  Future<void> createCourse(Course course) async {
    try {
      final response =
          await SupabaseService.client.from('courses').insert(course.toJson());

      print('course inserted succesfully: $response');
    } catch (e) {
      showSnackBar('Error', 'An error occured : $e');
    }
  }

  //pick thunmbnail
  void pickImage() async {
    File? file = await pickImageFromGallery();

    if (file != null) {
      thumbnail.value = file;
      //thumbnail.value = file;
      final String dir = "$userId/profile.jpg";
      final String path = await SupabaseService.client.storage
          .from(SupabaseService.S3_BUCKET)
          .upload(
            dir,
            file,
            fileOptions: FileOptions(upsert: true),
          );
      thumbnailPath.value = path;
    }
  }

  //fetch course details
  Future<void> fetchCourses() async {
    try {
      final response = await SupabaseService.client
          .from('courses')
          .select('*'); // Fetch all columns

      print('Courses fetched successfully: $response');

      for (var item in response) {
        fetchedCourses.add(item);
      }

      print(fetchedCourses);
      // fetchedCourses.assignAll(
      //     response.map((course) => Course.fromJson(course)).toList());
      // Ensure we explicitly convert it into a List<Course>

      //print('Parsed Courses: $coursesList');
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }
}
