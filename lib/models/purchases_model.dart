class PurchasesModel {
  String student_id;
  String course_id;
  double price_paid;
  DateTime purchase_date;

  PurchasesModel({
    required this.student_id,
    required this.course_id,
    required this.price_paid,
    required this.purchase_date,
  });

  // Convert JSON to Model
  factory PurchasesModel.fromJson(Map<String, dynamic> json) {
    return PurchasesModel(
        student_id: json['student_id'] ?? '',
        course_id: json['course_id'],
        price_paid: json['price_paid'] ?? '',
        purchase_date: json['purchase_date']);
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'student_id': student_id,
      'course_id': course_id,
      'price_paid': price_paid,
      'purchase_date': purchase_date,
    };
  }
}
