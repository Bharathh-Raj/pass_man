import 'package:flutter/foundation.dart';

String numToWords({@required int number}) {
  if (number == 0)
    return 'zero';
  else if (number == 1)
    return 'one';
  else if (number == 2)
    return 'two';
  else if (number == 3)
    return 'three';
  else if (number == 4)
    return 'four';
  else if (number == 5)
    return 'five';
  else if (number == 6)
    return 'six';
  else if (number == 7)
    return 'seven';
  else if (number == 8)
    return 'eight';
  else if (number == 9)
    return 'nine';
  else
    return 'ten';
}
