import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/course_controller.dart';
import 'package:lms/models/ChapterTopic_model.dart';
import 'package:lms/services/supabase_service.dart';
import 'package:lms/utils/helper.dart';

class AddChapterScreen extends StatelessWidget {
  final CourseController controller = Get.put(CourseController());
  final PageController pageController = PageController();
  final userId = SupabaseService.client.auth.currentUser!.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Linked Chapters & Topics")),
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                for (int i = 0; i < controller.chapters.length; i++) ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Side: Chapter Name
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.buttonColor,
                            radius: 25,
                            child: Text(
                              "C${i + 1}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          if (controller.chapters[i].value.topics.isNotEmpty)
                            Container(
                              width: 3,
                              height: 40.0 *
                                  controller.chapters[i].value.topics.length,
                              color: AppColors.buttonColor,
                            ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 1.6,
                                        color: AppColors.buttonColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 1.2,
                                        color: AppColors.hintColor)),
                                hintText: "Chapter Name",
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (val) =>
                                  controller.chapters[i].value.name = val,
                              controller: TextEditingController(
                                  text: controller.chapters[i].value.name),
                            ),
                            SizedBox(height: 10),
                            for (int j = 0;
                                j < controller.chapters[i].value.topics.length;
                                j++)
                              Row(
                                children: [
                                  CustomPaint(
                                    size: Size(20, 50),
                                    painter: LinePainter(),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              if (controller.videoUrl.isEmpty) {
                                                Get.dialog(
                                                  Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize: MainAxisSize
                                                            .min, // Prevents oversized dialog
                                                        children: [
                                                          Text(
                                                              'Add Youtube Video Url',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          SizedBox(height: 10),
                                                          TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText:
                                                                  'Enter URL',
                                                            ),
                                                          ),
                                                          SizedBox(height: 10),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text('Or')
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  'Upload Video',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              SizedBox(
                                                                width: 15,
                                                              ),
                                                              Obx(() {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .pickVideo();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            18,
                                                                        vertical:
                                                                            6),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                13),
                                                                        color: AppColors
                                                                            .containerColor,
                                                                        border: Border.all(
                                                                            color:
                                                                                AppColors.buttonColor)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        controller.videoFile.value ==
                                                                                null
                                                                            ? 'Upload'
                                                                            : 'Uploaded',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color: AppColors.buttonColor,
                                                                            fontSize: 16),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              })
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  controller
                                                                      .uploadVideo(
                                                                          i, j);
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              8),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              18,
                                                                          vertical:
                                                                              6),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            13),
                                                                    color: AppColors
                                                                        .buttonColor,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Done',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                Get.dialog(Dialog(
                                                  backgroundColor: Colors.white,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 15, bottom: 40),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            GestureDetector(
                                                                onTap: () {
                                                                  Get.back();
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .cancel_sharp,
                                                                  color: AppColors
                                                                      .buttonColor,
                                                                ))
                                                          ],
                                                        ),
                                                        Text(
                                                          'Error',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          'Video already uploaded',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color: Colors.grey
                                                                  .shade700),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                              }
                                            },
                                            child: Icon(
                                              Icons.video_call_rounded,
                                              color: controller.videoUrl.isEmpty
                                                  ? AppColors.hintColor
                                                  : AppColors.buttonColor,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                  width: 1.6,
                                                  color:
                                                      AppColors.buttonColor)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: AppColors.hintColor)),
                                          hintText: "Topic name",
                                          border: OutlineInputBorder(),
                                        ),
                                        onChanged: (val) => controller
                                            .chapters[i]
                                            .value
                                            .topics[j]
                                            .title = val,
                                        controller: TextEditingController(
                                            text: controller.chapters[i].value
                                                .topics[j].title),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () =>
                                        controller.removeTopic(i, j),
                                  ),
                                ],
                              ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  controller.addTopic(i);
                                },
                                child: Container(
                                    width: 120,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: AppColors.buttonColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Add Topic",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    )),
                              ),
                            ),

                            // Remove Chapter Button
                            if (controller.chapters.length >
                                1) // Only show if more than one chapter
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton.icon(
                                  onPressed: () => controller.removeChapter(i),
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  label: Text("Remove Chapter"),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1),
                  SizedBox(height: 10),
                ],
              ],
            ),
          ),
        );
      }),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Color(0xFF003096), // Button color
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.6), // Dark shadow (bottom-right)
              offset: Offset(0, 7),
              blurRadius: 5,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.7), // Light shadow (top-left)
              offset: Offset(-5, -5),
              blurRadius: 10,
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          backgroundColor:
              Color(0xFF003096), // Same as container for consistency
          elevation: 0, // Remove default shadow to rely on custom shadows
          onPressed: controller.addChapter,
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            "Add Chapter",
            style: TextStyle(
              color: Colors.white, // White text for better contrast
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF003096),
            padding: EdgeInsets.symmetric(vertical: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () async {
            await controller.saveChaptersToSupabase(
                controller.insertedCourseId.toString(), userId);
            Get.snackbar("Success", "Chapters saved to Supabase");
          },
          child: Text("Save Chapters",
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }
}

// Custom painter to draw connecting lines
class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.buttonColor
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
