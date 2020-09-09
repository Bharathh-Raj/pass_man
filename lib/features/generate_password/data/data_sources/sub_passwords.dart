import 'package:flutter/foundation.dart';

enum Type { DOMAIN, USERID }

class SubPasswords {
  static final alphaRegex = new RegExp(r'^[a-zA-Z]+$');

  static String ceaserCipherAWord({@required String str, @required int key}) {
    StringBuffer cipheredWord = new StringBuffer();
    int termInUTF = 0;
    for (String i in str.split('')) {
      termInUTF = i.codeUnitAt(0) + key;
      if (termInUTF > 122)
        cipheredWord.write('z');
      else
        cipheredWord.write(String.fromCharCode(termInUTF));
    }
    return cipheredWord.toString();
  }

  static String squareOf({@required int number}) {
    return (number * number).toString();
  }

  static String bracketMatchOf({@required int number}) {
    if (number < 2)
      return '(';
    else if (number < 4)
      return ')';
    else if (number < 6)
      return '{';
    else if (number < 8)
      return '}';
    else if (number < 10)
      return '[';
    else if (number < 12) return ']';
    return '(';
  }

  static String insertStars({int len = 1}) {
    return '*' * len;
  }

  static String insertAmpersands({int len = 1}) {
    return '&' * len;
  }

  static String insertDivide({int len = 1}) {
    return '/' * len;
  }

  static String insertPercentage({int len = 1}) {
    return '%' * len;
  }

  static String lengthMultiple({@required String lengthOf, @required int number}) {
    return (lengthOf.length * number).toString();
  }
}
