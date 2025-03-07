// import 'package:flutter/material.dart';
// import 'package:lms/color/colors.dart';

// class OverviewTab extends StatelessWidget {
//   const OverviewTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Graphic Design",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//                   ),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     "By Syed Hasnain",
//                     style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.grey.shade500),
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Row(
//                     children: List.generate(5, (starIndex) {
//                       return Icon(
//                         Icons.star,
//                         color: AppColors.buttonColor,
//                         size: 14,
//                       );
//                     }),
//                   )
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     "72\$",
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
//                   ),
//                   Text("Lorem Ipsum Text",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.grey.shade500))
//                 ],
//               )
//             ],
//           ),
//           SizedBox(
//             height: 18,
//           ),
//           Text(
//               "casca ca c aca c acaac ac ac aca ca cacaa ca ca ca cacaca ca cac acacacce  cew csce cac qc cecasc eccea cdcewc s ce s",
//               style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.grey.shade500))
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';

class OverviewTab extends StatefulWidget {
  final String title, description, length, duration;
  final double price, discount;
  final bool certificate;
  const OverviewTab(
      {super.key,
      required this.title,
      required this.description,
      required this.price,
      required this.length,
      required this.duration,
      this.certificate = false,
      this.discount = 0});

  @override
  _OverviewTabState createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  bool isExpanded = false;
  bool isOverflowing = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "By Syed Hasnain",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        Icons.star,
                        color: AppColors.buttonColor,
                        size: 14,
                      );
                    }),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "${widget.price.toString()}\$",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Lorem Ipsum Text",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final textSpan = TextSpan(
                text: widget.description,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade500),
              );

              final textPainter = TextPainter(
                text: textSpan,
                maxLines: 3,
                textDirection: TextDirection.ltr,
              );

              textPainter.layout(maxWidth: constraints.maxWidth);

              isOverflowing = textPainter.didExceedMaxLines;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textSpan.text!,
                    maxLines: isExpanded ? null : 3,
                    overflow: isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500),
                  ),
                  SizedBox(height: 5),

                  // ✅ Show "Read More" only if text exceeds 4 lines
                  if (isOverflowing)
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? "Read Less" : "Read More",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.buttonColor),
                      ),
                    ),
                ],
              );
            },
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                color: AppColors.containerColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.buttonColor)),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/Book.png',
                          height: 30,
                        ),
                        SizedBox(width: 5),
                        Text(widget.length)
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset(
                          'assets/Clock.png',
                          height: 30,
                        ),
                        SizedBox(width: 5),
                        Text(widget.duration)
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.certificate
                        ? Row(
                            children: [
                              Image.asset(
                                'assets/Certificate.png',
                                height: 30,
                              ),
                              SizedBox(width: 5),
                              Text("Certified")
                            ],
                          )
                        : Row(
                            children: [
                              Image.asset(
                                'assets/Certificate.png',
                                height: 30,
                              ),
                              SizedBox(width: 5),
                              Text("Not Certified")
                            ],
                          ),
                    SizedBox(height: 20),
                    widget.discount == 0
                        ? Row(
                            children: [
                              Icon(Icons.library_books),
                              SizedBox(width: 5),
                              Text("Discount")
                            ],
                          )
                        : Row(
                            children: [
                              Image.asset(
                                'assets/discount.png',
                                height: 30,
                              ),
                              SizedBox(width: 5),
                              Text("No Discount")
                            ],
                          )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Skills",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 3),
          // ✅ Use SizedBox instead of Expanded to prevent layout errors
          SizedBox(
            child: GridView.builder(
              shrinkWrap: true, // Allows it to take only the necessary space
              physics:
                  NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
              itemCount: 20, // Change dynamically as needed
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                childAspectRatio: 3.5,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.hintColor),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Center(
                    child: Text("Adobe"),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 90,
          )
        ],
      ),
    );
  }
}
