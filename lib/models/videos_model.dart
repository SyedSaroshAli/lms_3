class ReviewsModel {
  String title;
  String course_id;
  double duration;
  String video_url;

  ReviewsModel({
    required this.title,
    required this.course_id,
    required this.duration,
    required this.video_url,
  });

  // Convert JSON to Model
  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
        title: json['title'] ?? '',
        course_id: json['course_id'],
        duration: json['duration'] ?? '',
        video_url: json['video_url']);
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'course_id': course_id,
      'duration': duration,
      'video_url': video_url,
    };
  }
}
