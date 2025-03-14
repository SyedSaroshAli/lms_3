import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/reviews_controller.dart';
import 'package:lms/utils/helper.dart';
import 'package:lms/widgets/reviewIndicator_widget.dart';
import 'package:lms/widgets/review_tile.dart';

class ReviewsTab extends StatelessWidget {
  final String course_id;

  ReviewsTab({super.key, required this.course_id});

  final ReviewsController reviewsController = Get.find<ReviewsController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return Text(
                          reviewsController.averageRating.value
                              .toString(), // You might want to calculate this dynamically
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w500),
                        );
                      }),
                      RatingBarIndicator(
                          itemSize: 18,
                          rating: reviewsController.averageRating.value,
                          unratedColor: AppColors.hintColor,
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star,
                              color: AppColors.buttonColor,
                            );
                          }),
                      Text(reviewsController.countReviews.value.toString(),
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500))
                    ],
                  );
                })),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        RatingProgressIndicator(
                            text: '5',
                            value: reviewsController.fiveStarRatio.value),
                        RatingProgressIndicator(
                            text: '4',
                            value: reviewsController.fourStarRatio.value),
                        RatingProgressIndicator(
                            text: '3',
                            value: reviewsController.threeStarRatio.value),
                        RatingProgressIndicator(
                            text: '2',
                            value: reviewsController.twoStarRatio.value),
                        RatingProgressIndicator(
                            text: '1',
                            value: reviewsController.oneStarRatio.value),
                      ],
                    ))
              ],
            ),
          ),
          Obx(() => reviewsController.fetchedReviews.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'No reviews available',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: reviewsController.fetchedReviews.length,
                  itemBuilder: (context, index) {
                    var review = reviewsController.fetchedReviews[index];

                    // Ensure safe access to nested 'users' object
                    var user = review['user'] ?? {}; // Fix: users, not user

                    return review["course_id"] == course_id
                        ? ReviewTile(
                            datePosted:
                                formatDate(review['created_at'].toString()),
                            rating: review['rating'],
                            name: user['full_name'] ?? 'Unknown',
                            imageUrl: getS3Url(user['image']) ?? '',
                            review: review['comment'] ?? 'No comment',
                          )
                        : SizedBox.shrink(); // Fix: No null return
                  },
                )),
        ],
      ),
    );
  }
}
