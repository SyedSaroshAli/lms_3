import 'package:flutter/material.dart';
import 'package:lms/color/colors.dart';
import 'package:lms/widgets/inboxTile_Widget.dart';
import 'package:lms/widgets/inbox_buttonWidget.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  bool chat = true;
  bool call = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Inbox",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          // Changed from Expanded to Column
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors.buttonColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 16),
                        enabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        errorBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chat = true;
                      call = false;
                    });
                  },
                  child: InboxButtonwidget(
                      width: width, isSelected: chat, text: " Chat"),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chat = false;
                      call = true;
                    });
                  },
                  child: InboxButtonwidget(
                      width: width, isSelected: call, text: "Call"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              // Used Expanded here instead of inside Padding
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return inboxTile(
                      path: "",
                      name: "Sarosh",
                      msg: "d",
                      time: "sks",
                      newMessages: 2);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
