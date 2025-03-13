class Chapter {
  String name;
  List<Topic> topics;

  Chapter({required this.name, List<Topic>? topics})
      : topics = topics ?? []; // Ensure topics is mutable

  // Convert Chapter to JSON format
  Map<String, dynamic> toJson() {
    return {
      "chapter_name": name,
      "topics":
          topics.map((t) => t.toJson()).toList(), // Convert topics to JSON
    };
  }
}

class Topic {
  String title;
  String videoUrl;

  Topic({required this.title, required this.videoUrl});

  // Convert Topic to JSON format
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "video_url": videoUrl, // Ensure this matches your Supabase column names
    };
  }
}
