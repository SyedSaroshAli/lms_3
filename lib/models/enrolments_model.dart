class PurchasesModel {
  String student_id;
  String course_id;

  DateTime created_at;

  PurchasesModel({
    required this.student_id,
    required this.course_id,
    required this.created_at,
  });

  // Convert JSON to Model
  factory PurchasesModel.fromJson(Map<String, dynamic> json) {
    return PurchasesModel(
        student_id: json['student_id'] ?? '',
        course_id: json['course_id'],
        created_at: json['created_at']);
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'student_id': student_id,
      'course_id': course_id,
      'created_at': created_at,
    };
  }
}
