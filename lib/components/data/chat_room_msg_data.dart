import 'dart:math';

import 'package:flutterwebview/models/models/chat_room_msg_model.dart';

import '../../components/widgets/chat_room_msg.dart';

class ChatRoomMsgData {
  List<ChatRoomMsgModal> getChatRoomMsgList() {
    const String imgPath = 'lib/images/';
    const List<String> nameList = ['強哥', '強女', '強嫂', '強伯', '強弟'];
    const List<String> imgList = [
      '',
      'arrow_bottom.png',
      'arrow_top.webp',
      'arrow_left.gif',
      'arrow_right.gif'
    ];

    //隨機回傳index
    indexHandler(list) {
      var totalIndex = list.length;
      Random random = new Random();
      int randomIndex = random.nextInt(totalIndex);
      return list[randomIndex];
    }

    //生成指定比數資料
    msgDataHandler(value) {
      List<ChatRoomMsgModal> msgList = [];
      for (int i = 0; i < value; i++) {
        msgList.add(ChatRoomMsgModal(
            img: imgPath + indexHandler(imgList),
            text: '訊息$i',
            name: '${indexHandler(nameList)}:'));
      }
      return msgList;
    }

    return msgDataHandler(200);
  }
}
