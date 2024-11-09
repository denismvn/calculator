import 'dart:io';

import 'package:calculator/Presentor/Factory/fabric.dart';

class UIController {
  static UIFabric? _fabric;

  static UIFabric? getFabric() {
    if (_fabric == null) {
      if (Platform.isAndroid) {
        _fabric = AndroidFabric();
      } else if (Platform.isIOS) {
        _fabric = IOSFabric();
      } 
    }
    return _fabric;
  }
}