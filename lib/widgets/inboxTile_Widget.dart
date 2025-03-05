import 'package:flutter/material.dart';

class inboxTile extends StatelessWidget {
  final String path, name, msg, time;
  final int newMessages;
  const inboxTile(
      {super.key,
      required this.path,
      required this.name,
      required this.msg,
      required this.time,
      required this.newMessages});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Column(
            children: [
              CircleAvatar(),
            ],
          )
        ],
      ),
    );
  }
}
