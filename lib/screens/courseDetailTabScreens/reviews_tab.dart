import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/controllers/reviews_controller.dart';
import 'package:lms/widgets/review_tile.dart';

class ReviewsTab extends StatelessWidget {
  final String course_id;

  ReviewsTab({
    super.key,
    required this.course_id,
  });
  final ReviewsController reviewsController = Get.find<ReviewsController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          reviewsController.fetchedReviews.length, // Change the count as needed
      itemBuilder: (context, index) {
        print(course_id);
        return reviewsController.fetchedReviews[index]["course_id"] == course_id
            ? ReviewTile(
                name: reviewsController.fetchedReviews[index]['user']
                    ['full_name'],
                imageUrl: reviewsController.fetchedReviews[index]['user']
                    ['image'],
                review: reviewsController.fetchedReviews[index]['comment'],
              )
            : null;
      },
    );
  }
}
