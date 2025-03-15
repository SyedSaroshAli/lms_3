import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/color/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    List recentSearches = [
      "3D Design",
      "Graphic Design",
      "Web Development",
      "SEO & Marketing",
      "Finance & Accounting",
      "Personal Development",
      "Office Productivity",
      "HR Management"
    ];
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Search",
          style: GoogleFonts.mulish(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: 20,
            ),
            Text(
              "Recent Searches",
              style: GoogleFonts.jost(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: recentSearches.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Color(0xFFA0A4AB),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          recentSearches[index],
                          style: GoogleFonts.jost(
                            color: Color(0xFFA0A4AB),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
