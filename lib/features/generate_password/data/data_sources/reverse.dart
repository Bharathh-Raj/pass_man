import 'package:flutter/foundation.dart';

class Reverse {
  static String reverse({@required String str}) {
    return str.split('').reversed.join();
  }
}
