//定義首頁上方按鈕列表的資料集
import 'dart:core';

class ChatRoomMsgModal {
  String img = '';
  String name = '';
  String text = '';

  ChatRoomMsgModal({String? img, String? name, String? text}) {
    this.img = img!;
    this.name = name!;
    this.text = text!;
  }
}
