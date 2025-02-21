import 'package:flutter/material.dart';
import 'package:lms/widgets/lesson_chapter_tile.dart';

class LessonsTab extends StatelessWidget {
  const LessonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return LessonChapterTile();
        });
  }
}
