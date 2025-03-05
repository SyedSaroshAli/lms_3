import 'package:get/get.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:lms/utils/helper.dart';

class CourseController extends GetxController {
  RxList fetchedCourses = [].obs;
  //create a course
  Future<void> createCourse(
      String title,
      var teacherId,
      String desctiption,
      double price,
      String category,
      bool certificate,
      String duration,
      String courseImageUrl,
      String length,
      double discount) async {
    try {
      final response = await SupabaseService.client.from('courses').insert({
        'teacher_id': teacherId,
        'title': title,
        'description': desctiption,
        'price': price,
        'category': category,
        'certificate': certificate,
        'duration': duration,
        'url': courseImageUrl,
        'length': length,
        'discount': discount
      });

      print('course inserted succesfully: $response');
    } catch (e) {
      showSnackBar('Error', 'An error occured : $e');
    }
  }

  //fetch course details
  Future<void> fetchCourses() async {
    try {
      final response = await SupabaseService.client
          .from('course')
          .select('*'); // Fetch all columns

      print('Courses fetched successfully: $response');
      fetchedCourses.value = response;
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }
}
