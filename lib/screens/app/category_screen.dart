import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/color/colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List categoryImages = [
      'assets/3d_design.png',
      'assets/graphic_design.png',
      'assets/web_dev.png',
      'assets/seo_mark.png',
      'assets/finance_accounting.png',
      'assets/personal_dev.png',
      'assets/office_productivity.png',
      'assets/hr_management.png'
    ];
    final List categoryNames = [
      '3D Design',
      'Graphic Design',
      'Web Development',
      'SEO & Marketing',
      'Finance & Accounting',
      'Personal Development',
      'Office Productivity',
      'HR Management'
    ];
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "All Category",
          style: GoogleFonts.mulish(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 64,
              margin: EdgeInsets.symmetric(vertical: 6),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15), // Slight rounding
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Light shadow color
                    spreadRadius: 1,
                    blurRadius: 10, // Smooth blur
                    offset: Offset(-5, 5), // Left shadow
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Light shadow color
                    spreadRadius: 1,
                    blurRadius: 10, // Smooth blur
                    offset: Offset(5, 5), // Right shadow
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 10),
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search for..",
                          hintStyle: GoogleFonts.mulish(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          enabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          errorBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: AppColors.buttonColor),
                    child: Center(
                      child: Image.asset(
                        'assets/searchWhite.png',
                        height: 16,
                        width: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              // Ensures GridView takes available space
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 10, // Space between columns
                  mainAxisSpacing: 10, // Space between rows
                  childAspectRatio: 1, // Adjust this for item size
                ),
                itemCount: categoryNames.length, // Total items in the grid
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            categoryImages[index],
                            height: 70,
                            width: 70,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(categoryNames[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                // Change the text
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
