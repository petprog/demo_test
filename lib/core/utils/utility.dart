import 'package:flutter/foundation.dart';

class Utility {
  static debugPrint(Object msg) {
    if (kDebugMode) {
      print(msg);
    }
  }
}
