import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lms/color/colors.dart';

class ReviewTile extends StatelessWidget {
  final String name, imageUrl, review, datePosted;
  final int rating;
  //final double rating;
  const ReviewTile(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.review,
      required this.rating,
      required this.datePosted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Spacer(),
            Icon(Icons.more_vert),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              RatingBarIndicator(
                  unratedColor: AppColors.containerColor,
                  itemCount: 5,
                  itemSize: 16,
                  rating: rating.toDouble(),
                  itemBuilder: (context, index) {
                    return Icon(
                      Icons.star,
                      color: AppColors.buttonColor,
                    );
                  }),
              SizedBox(
                width: 6,
              ),
              Text(datePosted,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500))
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(review,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
