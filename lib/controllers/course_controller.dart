import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lms/models/ChapterTopic_model.dart';
import 'package:lms/models/course_model.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:lms/utils/helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class CourseController extends GetxController {
  RxString selectedCurrency = "Dollar".obs;
  List<String> categories = ["UI/UX", "Graphic Design", "Figma"];
  late List subCategories = categories.sublist(1);
  RxString searchQuery = ''.obs;
  RxDouble discount = 10.0.obs;
  RxString videoUrl = ''.obs;
  final userId = SupabaseService.client.auth.currentUser!.id;
  RxBool isCertified = false.obs;
  RxString selectedCourse = "All".obs;
  RxList<Chapter> chapters = <Chapter>[].obs;

  RxString insertedCourseId = ''.obs; // Observable to store course ID
  RxBool oldestToNew = false.obs;
  RxBool newestToOldest = false.obs;
  RxBool lowestToHighet = false.obs;
  var videoFile = Rxn<File>();
  RxBool highestToLowest = false.obs;
  RxInt currentStep = 0.obs;
  RxList fetchedCourses = [].obs;
  RxList filteredCourses = [].obs;

  Rx<File?> thumbnail = Rx<File?>(null);
  RxString thumbnailPath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourses();

    print("On init called");
  }

  //create a course
  Future<void> createCourse(Course course) async {
    try {
      final response = await SupabaseService.client
          .from('courses')
          .insert(course.toJson())
          .select();
      if (response.isNotEmpty) {
        insertedCourseId.value = response[0]['id']; // Store course ID
        print('Inserted Course ID: ${insertedCourseId.value}');
      }
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

  // Example usage in a button click
  void pickVideo() async {
    File? video = await pickVideoFromGallery();
    if (video != null) {
      videoFile.value = video;
      showSnackBar("Video Selected", "Ready to upload.");
    } else {
      showSnackBar("No Video Selected", "Please pick a video file.");
    }
  }

  Future<void> uploadVideo(int chapterIndex, int topicIndex) async {
    if (videoFile.value == null) {
      showSnackBar("No Video Selected", "Please pick a video file.");
      return;
    }

    String? url = await uploadVideoToSupabase(videoFile.value!);

    if (url != null) {
      // Directly update the topic's video URL
      chapters[chapterIndex].topics[topicIndex].videoUrl = url;

      // Refresh the list to reflect the change
      chapters.refresh();

      showSnackBar("Upload Successful", "Video URL: $url");
      videoFile.value = null;
    } else {
      showSnackBar("Upload Failed", "Please try again.");
    }
  }

//   Future<void> uploadVideo(int chapterIndex, int topicIndex) async {
//   if (videoFile.value == null) {
//     showSnackBar("No Video Selected", "Please pick a video file.");
//     return;
//   }

//   String? url = await uploadVideoToSupabase(videoFile.value!); // Upload the video

//   if (url != null) {
//     chapters[chapterIndex].update((chapter) {
//       if (chapter != null) {
//         // Create a modifiable copy of the list and update it
//         var updatedTopics = List<Topic>.from(chapter.topics);
//         var updatedVideoUrls = List<String>.from(updatedTopics[topicIndex].videoUrls);

//         updatedVideoUrls.add(url); // Add the new video URL

//         updatedTopics[topicIndex] = updatedTopics[topicIndex].copyWith(videoUrls: updatedVideoUrls);

//         chapter.topics = updatedTopics; // Update the chapter's topics list
//       }
//     });

//     showSnackBar("Upload Successful", "Video URL: $url");
//   } else {
//     showSnackBar("Upload Failed", "Please try again.");
//   }
// }

  //querry based searching
  // Query-based searching
  void searchCourses(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      filteredCourses.assignAll(fetchedCourses);
    } else {
      filteredCourses.assignAll(fetchedCourses.where((course) {
        String title = (course['title'] ?? '').toString().toLowerCase();
        return title.contains(query.toLowerCase());
      }).toList());
    }
    print('Filtered courses count: ${filteredCourses.length}');
    print('Filtered courses: $filteredCourses');
  }

  //fetch course details
  // Fetch courses from Supabase
  Future<void> fetchCourses() async {
    var response = [];
    try {
      if (selectedCourse.value == "All") {
        response = await SupabaseService.client.from('courses').select('*');
      }

      print('Courses fetched successfully: $response');

      fetchedCourses.assignAll(response);
      filteredCourses.assignAll(response); // Initialize both lists correctly
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }

  void applySorting() {
    filteredCourses.sort((a, b) {
      DateTime dateA = DateTime.parse(a['created_at']);
      DateTime dateB = DateTime.parse(b['created_at']);
      double priceA = (a['price'] ?? 0).toDouble();
      double priceB = (b['price'] ?? 0).toDouble();

      // Sorting based on selected conditions
      int dateComparison = 0;
      int priceComparison = 0;

      if (oldestToNew.value) {
        dateComparison = dateA.compareTo(dateB); // Oldest to Newest
      } else if (newestToOldest.value) {
        dateComparison = dateB.compareTo(dateA); // Newest to Oldest
      }

      if (lowestToHighet.value) {
        priceComparison = priceA.compareTo(priceB); // Lowest to Highest
      } else if (highestToLowest.value) {
        priceComparison = priceB.compareTo(priceA); // Highest to Lowest
      }

      // If both sorting conditions are applied, prioritize date first, then price
      if (dateComparison != 0) {
        return dateComparison;
      }
      return priceComparison;
    });

    filteredCourses.refresh(); // Refresh UI
  }

  //Adding chapters and their topics
  void addChapter() {
    var newChapter = Chapter(name: "", topics: []);
    chapters.add(newChapter);
  }

  void addTopic(int chapterIndex) {
    if (chapterIndex < chapters.length) {
      chapters[chapterIndex].topics.add(Topic(title: "", videoUrl: ""));
      chapters.refresh(); // Notify GetX about the update
    }
  }

  void removeTopic(int chapterIndex, int topicIndex) {
    if (chapterIndex < chapters.length &&
        topicIndex < chapters[chapterIndex].topics.length) {
      chapters[chapterIndex].topics.removeAt(topicIndex);
      chapters.refresh();
    }
  }

  void removeChapter(int index) {
    if (index < chapters.length) {
      chapters.removeAt(index);
    }
  }

  Future<void> saveChaptersToSupabase(String courseId, String teacherId) async {
    final supabase = Supabase.instance.client;

    for (var chapter in chapters) {
      // No need for .value anymore
      // Convert topics to a format suitable for Supabase
      var topicsJson = chapter.topics.map((t) => t.toJson()).toList();

      final response = await supabase.from("chapters").insert({
        "course_id": courseId,
        "teacher_id": teacherId,
        "chapter_name": chapter.name,
        "topics": topicsJson, // Now matches the correct structure
      });

      if (response.error != null) {
        print("Error saving chapter: ${response.error!.message}");
      } else {
        print("Chapter '${chapter.name}' inserted successfully!");
      }
    }
  }
}
