import 'package:flutter/material.dart';

class chatMessage extends StatelessWidget {
  const chatMessage({Key? key, required this.text, required this.sender}) : super(key: key);

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20.0),
          child: CircleAvatar(child: Text(sender[0])),
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sender, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 7,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: Text(text),
                )
              ],
        ))
    ],
    );
  }
}
