import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../models/models/chat_room_msg_model.dart';

class ChatRoomMsg extends StatefulWidget {
  final ChatRoomMsgModal msgListItem;
  const ChatRoomMsg({Key? key, required this.msgListItem}) : super(key: key);

  @override
  State<ChatRoomMsg> createState() => _ChatRoomMsgState();
}

class _ChatRoomMsgState extends State<ChatRoomMsg> {
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      animationDuration: const Duration(seconds: 1),
      curve: Curves.bounceIn,
      direction: Direction.vertical,
      child: Container(
        padding: const EdgeInsets.all(3),
        height: 24,
        child: Row(
          children: <Widget>[
            if (widget.msgListItem.img != 'lib/images/')
              Image.asset(widget.msgListItem.img),
            Text(
              widget.msgListItem.name,
              style: const TextStyle(color: Color.fromARGB(255, 102, 171, 228)),
            ),
            Text(
              widget.msgListItem.text,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
