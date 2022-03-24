//控制按鈕點擊時間間隔
class BtnDelayUtils{
  //時間間隔
  int timeInterval;

  late var lastPopTime;

  BtnDelayUtils(this.timeInterval){
    lastPopTime = DateTime.now().subtract(Duration(seconds: timeInterval + 1));
  }

  //是否連續點擊按鈕
  //是回傳false
  //否回傳true
  bool intervalClick(){
    //避免重複點擊
    if(DateTime.now().difference(lastPopTime) > Duration(seconds: timeInterval)){
      lastPopTime = DateTime.now();
      return true;
    }else{
      //lastPopTime = DateTime.now(); //強制幾秒後才能點擊
      return false;
    }
  }
}