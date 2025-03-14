import 'package:get/get.dart';
import 'package:lms/models/videos_model.dart';
import 'package:lms/services/supabase_service.dart';

class ReviewsController extends GetxController {
  RxList fetchedReviews = [].obs;
  RxDouble averageRating = 0.0.obs; // Store the average rating
  RxString course_id = ''.obs;
  RxInt countReviews = 0.obs;

// Counters for each star rating
  RxInt fiveStarCount = 0.obs;
  RxInt fourStarCount = 0.obs;
  RxInt threeStarCount = 0.obs;
  RxInt twoStarCount = 0.obs;
  RxInt oneStarCount = 0.obs;

  // Proportions for linear progress indicators
  RxDouble fiveStarRatio = 0.0.obs;
  RxDouble fourStarRatio = 0.0.obs;
  RxDouble threeStarRatio = 0.0.obs;
  RxDouble twoStarRatio = 0.0.obs;
  RxDouble oneStarRatio = 0.0.obs;

  Future<void> fetchReviews(String course_id) async {
    var response = [];
    try {
      response = await SupabaseService.client
          .from('reviews')
          .select('*, user(*)') // Joins reviews with users table
          .eq('course_id', course_id);

      print('Reviews fetched successfully: $response');

      fetchedReviews.assignAll(response);
      calculateAverageRating();
      calculateStarCounts();
    } catch (e) {
      print('Error fetching reviews: $e');
    }
  }

  void calculateAverageRating() {
    if (fetchedReviews.isEmpty) {
      averageRating.value = 0.0;
      return;
    }

    double totalRating = 0.0;
    int count = 0;

    for (var review in fetchedReviews) {
      if (review['rating'] != null) {
        totalRating += review['rating'];
        count++;
      }
    }
    countReviews.value = count;
    averageRating.value = count > 0 ? totalRating / count : 0.0;
    print('Average Rating: ${averageRating.value}');
  }

  void calculateStarCounts() {
    // Reset counts
    fiveStarCount.value = 0;
    fourStarCount.value = 0;
    threeStarCount.value = 0;
    twoStarCount.value = 0;
    oneStarCount.value = 0;

    for (var review in fetchedReviews) {
      int rating = review['rating'] ?? 0;
      if (rating == 5) fiveStarCount.value++;
      if (rating == 4) fourStarCount.value++;
      if (rating == 3) threeStarCount.value++;
      if (rating == 2) twoStarCount.value++;
      if (rating == 1) oneStarCount.value++;
    }

    // Calculate proportions for progress indicators
    int totalReviews = countReviews.value;

    fiveStarRatio.value =
        totalReviews > 0 ? fiveStarCount.value / totalReviews : 0.0;
    fourStarRatio.value =
        totalReviews > 0 ? fourStarCount.value / totalReviews : 0.0;
    threeStarRatio.value =
        totalReviews > 0 ? threeStarCount.value / totalReviews : 0.0;
    twoStarRatio.value =
        totalReviews > 0 ? twoStarCount.value / totalReviews : 0.0;
    oneStarRatio.value =
        totalReviews > 0 ? oneStarCount.value / totalReviews : 0.0;
  }
}
