import 'package:flutter/foundation.dart';

class GatherSingleCharacter {
  static String firstLetter({@required String str}) {
    return str.substring(0, 1);
  }

  static String secondLetter({@required String str}) {
    if (str.length >= 3)
      return str.substring(1, 2);
    else
      return GatherSingleCharacter.lastLetter(str: str);
  }

  static String thirdLetter({@required String str}) {
    if (str.length >= 3)
      return str.substring(2, 3);
    else
      return GatherSingleCharacter.lastLetter(str: str);
  }

  static String lastLetter({@required String str}) {
    return str.substring(str.length - 1, str.length);
  }
}
