import 'package:get/get.dart';
import 'package:lms/models/videos_model.dart';
import 'package:lms/services/supabase_service.dart';

class ReviewsController extends GetxController {
  RxList fetchedReviews = [].obs;
  RxString course_id = ''.obs;

  Future<void> fetchReviews(String course_id) async {
    var response = [];
    try {
      response = await SupabaseService.client
          .from('reviews')
          .select('*, user(*)') // Joins reviews with users table
          .eq('course_id', course_id);

      print('Reviews fetched successfully: $response');

      fetchedReviews.assignAll(response);
    } catch (e) {
      print('Error fetching reviews: $e');
    }
  }
}
