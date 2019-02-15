import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Utils {
  ///获取时间戳毫秒数,13位
  int getMilliseconds() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  ///复制到剪贴板
  void setClipData(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  ///获取屏幕宽度
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  ///获取屏幕高度
  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  ///获取屏幕状态栏高度
  double getStatusBarTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  ///获取屏幕方向
  Orientation getScreenOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  Future<String> getBatteryLevel() async {
    var batteryLevel = 'unknown';
    MethodChannel methodChannel = MethodChannel('samples.flutter.io/battery');
    try {
      int result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    return batteryLevel;
  }
}
