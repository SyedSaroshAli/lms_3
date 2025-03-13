import 'package:get/get.dart';
import 'package:lms/models/videos_model.dart';
import 'package:lms/services/supabase_service.dart';

class EnrollmentsController extends GetxController {
  RxList fetchedEnrollments = [].obs;

  RxString course_id = ''.obs;

  Future<void> fetchEnrollments(String course_id) async {
    var response = [];
    try {
      response = await SupabaseService.client
          .from('enrollments')
          .select('*, user(*)') // Joins Enrollments with users table
          .eq('course_id', course_id);

      print('Enrollments fetched successfully: $response');

      fetchedEnrollments.assignAll(response);
    } catch (e) {
      print('Error fetching Enrollments: $e');
    }
  }
}
