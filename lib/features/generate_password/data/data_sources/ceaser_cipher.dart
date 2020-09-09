import 'package:flutter/foundation.dart';

class CeaserCipher {
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
}
