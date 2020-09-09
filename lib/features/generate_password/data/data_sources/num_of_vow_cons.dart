import 'package:flutter/foundation.dart';

int numOfVowelsIn({@required String str}) {
  int vowelCount = 0;
  for (String i in str.split('')) {
    if (i == 'a' || i == 'e' || i == 'i' || i == 'o' || i == 'u') vowelCount++;
  }
  return vowelCount;
}

int numOfConsonantsIn({@required String str}) {
  int consonantCount = 0;
  for (String i in str.split('')) {
    if (i != 'a' && i != 'e' && i != 'i' && i != 'o' && i != 'u') consonantCount++;
  }
  return consonantCount;
}
