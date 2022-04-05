import 'dart:async';

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
  //定義stream控制器
  StreamController<List<ChatRoomMsgModal>> msgStreamController =
      StreamController();

  //獲取StreamSink做add入口
  StreamSink<List<ChatRoomMsgModal>> get dataSink => msgStreamController.sink;

  //獲取Stream用於監聽
  Stream<List<ChatRoomMsgModal>> get dataStream => msgStreamController.stream;

  @override
  void initState() {
    super.initState();
    //初始化stream
    msgStreamController = StreamController<List<ChatRoomMsgModal>>();
  }

  delayHandler(msgList) async {
    print('is run');
    for (var i = 0; i < msgList.length; i++) {
      await Future.delayed(const Duration(milliseconds: 1000), () {
        print('is in count');

        dataSink.add(msgList[i]);

        // print(dataSink);

        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            ChatRoomMsgModal msgListData = msgList[index]; //根據索引取得對應的資料
            return ChatRoomMsg(msgListItem: msgListData);
          },
          itemCount: msgList.length,
        );
      });
    }
  }

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
              // child: ListView.builder(
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) {
              //     ChatRoomMsgModal msgListData = msgList[index]; //根據索引取得對應的資料
              //     return ChatRoomMsg(msgListItem: msgListData);
              //   },
              //   itemCount: msgList.length,
              // ),
              child: StreamBuilder(
                stream: dataStream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<ChatRoomMsgModal>> snapshot) {
                  List<ChatRoomMsgModal> data = snapshot.data ?? []; //get data
                  return delayHandler(msgList);
                  // return ListView.builder(
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index) {
                  //     ChatRoomMsgModal msgListData =
                  //         msgList[index]; //根據索引取得對應的資料
                  //     return ChatRoomMsg(msgListItem: msgListData);
                  //   },
                  //   itemCount: msgList.length,
                  // );
                  // return const Text(
                  //   '123',
                  //   style: TextStyle(color: Colors.white),
                  // );
                },
              )),
        )
      ],
    );
  }
}
