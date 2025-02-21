import 'package:flutter/material.dart';
import 'package:lms/widgets/review_tile.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6, // Change the count as needed
      itemBuilder: (context, index) {
        return ReviewTile();
      },
    );
  }
}
