import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/controllers/course_controller.dart';
import 'package:lms/widgets/buttonWidget.dart';

class AddCourseScreen1 extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  AddCourseScreen1(
      {super.key,
      required this.titleController,
      required this.priceController,
      required this.descriptionController});

  final CourseController courseController = Get.find<CourseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Thumbnail of your course",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    if (courseController.thumbnail.value != null) {
                      // Show full-screen image preview
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                children: [
                                  Image.file(
                                    courseController.thumbnail.value!,
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: IconButton(
                                      icon: Icon(Icons.close,
                                          color: Colors.white, size: 30),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      // Open image picker if no image is uploaded
                      courseController.pickImage();
                    }
                  },
                  child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.buttonColor),
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: courseController.thumbnail.value == null
                          ? Icon(
                              Icons.add,
                              size: 20,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                courseController.thumbnail.value!,
                                fit: BoxFit.cover,
                              ),
                            )),
                );
              }),

              SizedBox(
                height: 10,
              ),
              // Title
              Text(
                "Title",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.containerColor,
                ),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Enter title of your course",
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(height: 14),

              // Description
              Text(
                "Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6),
              Container(
                height: 170, // Fixed height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.containerColor,
                ),
                child: TextField(
                  controller: descriptionController, // Fixed controller
                  keyboardType: TextInputType.multiline,
                  maxLines: null, // Allows unlimited lines
                  expands: true, // Makes it take full container height
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Enter description of your course",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 14),

              // Price Row
              Text(
                "Price of Your Course",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Obx(() {
                    return Container(
                      width: 118,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButton<String>(
                        value: courseController.selectedCurrency.value,
                        isDense: true, // Fixes layout issues
                        onChanged: (value) {
                          courseController.selectedCurrency.value = value!;
                        },
                        underline: SizedBox(), // Removes default underline
                        items: [
                          DropdownMenuItem(
                            value: "Dollar",
                            child: Text("Dollar (\$)"),
                          ),
                          DropdownMenuItem(
                            value: "Pk Rupees",
                            child: Text("PKR (₨)"),
                          ),
                          DropdownMenuItem(
                            value: "Euro",
                            child: Text("Euro (€)"),
                          ),
                        ],
                      ),
                    );
                  }),
                  // Currency Dropdown

                  SizedBox(width: 15),

                  // Price Input Field
                  Expanded(
                    child: Container(
                      decoration:
                          BoxDecoration(color: AppColors.containerColor),
                      child: TextField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Price",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     // Container(
              //     //   decoration: BoxDecoration(
              //     //       borderRadius: BorderRadius.circular(15),
              //     //       color: AppColors.buttonColor),
              //     //   child: Center(
              //     //       child: Text(
              //     //     "Next",
              //     //     style: TextStyle(color: Colors.white, fontSize: 18),
              //     //   )),
              //     // )
              //     ButtonWidget(
              //       text: "Next",
              //       width: MediaQuery.of(context).size.width / 2.5,
              //     ),
              //   ],
              // )
              // Text(
              //   "Course Length",
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              // ),
              // SizedBox(height: 6),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: AppColors.containerColor,
              //   ),
              //   child: TextField(
              //     controller: titleController,
              //     decoration: InputDecoration(
              //       contentPadding: EdgeInsets.all(10),
              //       hintText: "Enter the length of the course",
              //       focusedBorder:
              //           UnderlineInputBorder(borderSide: BorderSide.none),
              //       enabledBorder:
              //           UnderlineInputBorder(borderSide: BorderSide.none),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
