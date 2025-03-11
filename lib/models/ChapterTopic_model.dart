class Chapter {
  String name;
  List<Topic> topics;

  Chapter({required this.name, List<Topic>? topics})
      : topics = topics ?? [Topic(title: '')];
}

class Topic {
  String title;
  List<String> videoUrls; // Change from single URL to a list

  Topic({required this.title, this.videoUrls = const []});

  Map<String, dynamic> toJson() => {
        "title": title,
        "video_urls": videoUrls, // Store as an array in DB
      };

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      title: json["title"],
      videoUrls: List<String>.from(json["video_urls"] ?? []),
    );
  }
}
