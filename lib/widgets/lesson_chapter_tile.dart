import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/models/ChapterTopic_model.dart';

// ✅ Lesson Chapter Tile - Uses Chapter Model
class LessonChapterTile extends StatefulWidget {
  final Chapter chapter; // Now using Chapter model
  final String i;

  const LessonChapterTile({super.key, required this.chapter, required this.i});

  @override
  _LessonChapterTileState createState() => _LessonChapterTileState();
}

class _LessonChapterTileState extends State<LessonChapterTile> {
  bool _isExpanded = false; // State for chapter dropdown

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ Chapter Header (Toggles Expansion)
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            margin: EdgeInsets.only(top: 5, left: 15, right: 15),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: RichText(
                    text: TextSpan(
                      text: 'Chapter ${widget.i}: ', // Default text style
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.chapter.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),

                // TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 24,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),

        // ✅ Animated Expansion for Topics
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: _isExpanded ? (widget.chapter.topics.length * 55.0) : 0,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.chapter.topics.length,
            itemBuilder: (context, index) {
              return TopicTile(topic: widget.chapter.topics[index]);
            },
          ),
        ),
      ],
    );
  }
}

// ✅ Topic Tile (Expands to Show Video)
class TopicTile extends StatefulWidget {
  final Topic topic;

  const TopicTile({super.key, required this.topic});

  @override
  _TopicTileState createState() => _TopicTileState();
}

class _TopicTileState extends State<TopicTile> {
  bool _isExpanded = false; // State for topic dropdown

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.topic.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.play_circle,
                  size: 22,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ✅ Video Player Screen (Dummy)
class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Center(
        child: Text(
          "Playing Video: $videoUrl",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
