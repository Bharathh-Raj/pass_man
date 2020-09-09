import 'package:flutter/foundation.dart';

class GatherCharacters {
  static String gatherEvenCharacters({@required String str}) {
    StringBuffer evenCharacters = new StringBuffer();
    for (int i = 1; i < str.length; i += 2) {
      evenCharacters.write(str.substring(i, i + 1));
    }
    print('Gether even characters:' + evenCharacters.toString());
    return evenCharacters.toString();
  }

  static String gatherOddCharacters({@required String str}) {
    StringBuffer oddCharacters = new StringBuffer();
    for (int i = 0; i < str.length; i += 2) {
      oddCharacters.write(str.substring(i, i + 1));
    }
    return oddCharacters.toString();
  }
}
