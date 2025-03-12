import 'package:flutter/material.dart';

class Chapter {
  String name;
  List<Topic> topics;
  TextEditingController controller;

  Chapter({required this.name, List<Topic>? topics})
      : topics = topics ?? [], // Make it mutable
        controller = TextEditingController(text: name);

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
  TextEditingController controller;

  Topic({required this.title, required this.videoUrl})
      : controller = TextEditingController(text: title);

  // Convert Topic to JSON format (exclude the controller)
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "video_url": videoUrl, // Ensure this matches your Supabase column names
    };
  }
}
