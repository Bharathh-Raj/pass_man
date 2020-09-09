import 'package:flutter/foundation.dart';

class GatherTwoChars {
  static String firstAndLast({@required String str}) {
    return str.substring(0, 1) + str.substring(str.length - 1);
  }

  static String firstTwo({@required String str}) {
    return str.substring(0, 2);
  }

  static String lastTwo({@required String str}) {
    return str.substring(str.length - 2);
  }
}
