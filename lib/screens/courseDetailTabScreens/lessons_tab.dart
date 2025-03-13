import 'package:flutter/material.dart';
import 'package:lms/models/ChapterTopic_model.dart';
import 'package:lms/widgets/lesson_chapter_tile.dart';

class LessonsTab extends StatelessWidget {
  const LessonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return LessonChapterTile(
            i: "1",
            chapter: Chapter(
                name: "Introduction to UI hello there for you",
                topics: [
                  Topic(title: "Topic 1 : Introduction", videoUrl: 'Video Url'),
                  Topic(
                      title: "Topic 2 : Detailed Intro", videoUrl: 'Video Url')
                ]),
          );
        });
  }
}
