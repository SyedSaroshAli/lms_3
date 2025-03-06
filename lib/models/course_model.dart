class Course {
  String title;
  dynamic teacher_id;
  String description;
  double price;
  String category;
  bool certificate;
  String duration;
  String url;
  String length;
  double discount;

  Course({
    required this.title,
    required this.teacher_id,
    required this.description,
    required this.price,
    required this.category,
    required this.certificate,
    required this.duration,
    required this.url,
    required this.length,
    required this.discount,
  });

  // Convert JSON to Model
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'] ?? '',
      teacher_id: json['teacher_id'],
      description: json['description'] ?? '',
      price: (json['price'] as num).toDouble(),
      category: json['category'] ?? '',
      certificate: json['certificate'] ?? false,
      duration: json['duration'] ?? '',
      url: json['url'] ?? '',
      length: json['length'] ?? '',
      discount: (json['discount'] as num).toDouble(),
    );
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'teacher_id': teacher_id,
      'description': description,
      'price': price,
      'category': category,
      'certificate': certificate,
      'duration': duration,
      'url': url,
      'length': length,
      'discount': discount,
    };
  }
}
