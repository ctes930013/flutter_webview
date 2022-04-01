import 'package:flutter/material.dart';

import '../components/widgets/chat_room_msg.dart';
import '../components/data/chat_room_msg_data.dart';
import '../models/models/chat_room_msg_model.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    ChatRoomMsgData data = ChatRoomMsgData();
    var msgList = data.getChatRoomMsgList();

    return Stack(
      children: <Widget>[
        Image.asset(
          'lib/images/chat_room_background.jpeg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: 50,
            height: 50,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.cancel_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            width: 300,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                ChatRoomMsgModal msgListData = msgList[index]; //根據索引取得對應的資料
                return ChatRoomMsg(msgListItem: msgListData);
              },
              itemCount: msgList.length,
            ),
          ),
        )
      ],
    );
  }
}
