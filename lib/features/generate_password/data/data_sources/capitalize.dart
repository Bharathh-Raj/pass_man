import 'package:flutter/foundation.dart';

class Capitalize {
  static String capitalizeEvenCharacters({@required String str}) {
    StringBuffer capitalizedEvenCharactes = new StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i % 2 == 1)
        capitalizedEvenCharactes.write(str.substring(i, i + 1).toUpperCase());
      else
        capitalizedEvenCharactes.write(str.substring(i, i + 1));
    }
    return capitalizedEvenCharactes.toString();
  }

  static String capitalizeOddCharacters({@required String str}) {
    StringBuffer capitalizedOddCharactes = new StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i % 2 == 0)
        capitalizedOddCharactes.write(str.substring(i, i + 1).toUpperCase());
      else
        capitalizedOddCharactes.write(str.substring(i, i + 1));
    }
    return capitalizedOddCharactes.toString();
  }

  static String capitalizeAllCharacters({@required String str}) {
    return str.toUpperCase();
  }

  static String capitalizeFirstCharacter({@required String str}) {
    return str.substring(0, 1).toUpperCase() + str.substring(1, str.length);
  }

  static String capitalizeLastCharacter({@required String str}) {
    return str.substring(0, str.length - 1) + str.substring(str.length - 1).toUpperCase();
  }
}
