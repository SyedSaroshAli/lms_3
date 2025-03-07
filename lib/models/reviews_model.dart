class ReviewsModel {
  String student_id;
  String course_id;
  double rating;
  String comment;

  ReviewsModel({
    required this.student_id,
    required this.course_id,
    required this.rating,
    required this.comment,
  });

  // Convert JSON to Model
  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
        student_id: json['student_id'] ?? '',
        course_id: json['course_id'],
        rating: json['rating'] ?? '',
        comment: json['comment']);
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'student_id': student_id,
      'course_id': course_id,
      'rating': rating,
      'comment': comment,
    };
  }
}
