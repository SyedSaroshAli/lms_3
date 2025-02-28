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
      child: Row(
        children: [
          CircleAvatar(),
          Column(
            children: [
              Text(name),
              Text(msg),
            ],
          )
        ],
      ),
    );
  }
}
