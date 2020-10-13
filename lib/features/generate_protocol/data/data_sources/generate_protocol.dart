import 'dart:math';

import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';

abstract class ProtocolDataSource {
  Protocol generateProtocol();
}

class ProtocolDataSourceImpl {
  Random random;
  ProtocolDataSourceImpl() {
    random = new Random();
  }

  Protocol generateProtocol() {
    StringBuffer protocol = new StringBuffer();
    protocol.write(shrinkTheDomain());
    protocol.write(ceaserCipherProtocol());
    protocol.write(countProtocol());
    protocol.write(squareProtocol());
    protocol.write(insertBracketProtocol());
    protocol.write(insertOperationProtocol());
    protocol.write(twoUserNameChars());
    protocol.write(numToChars());
    protocol.write(vctMultipleVCT());
    return Protocol(protocol: protocol.toString());
  }

  String shrinkTheDomain() {
    StringBuffer protocol;
    protocol.write('zxwxd');

    int parseOddOrEven = random.nextInt(2);
    if (parseOddOrEven == 0)
      protocol.write('po'); //po -> parse odd
    else
      protocol.write('pe'); //pe -> parse even

    int capitalizeOddOrEven = random.nextInt(3);
    if (capitalizeOddOrEven == 0)
      protocol.write('co'); //co -> capitalize odd
    else if (capitalizeOddOrEven == 1)
      protocol.write('ce'); //ce -> capitalize even
    else
      protocol.write('ca'); //ca -> capitalize all

    int reverseOrNot = random.nextInt(2);
    if (reverseOrNot == 0)
      protocol.write('xr'); //xr -> reverse
    else
      protocol.write('nr'); //nr -> not reverse

    print(protocol.toString());
    return protocol.toString();
  }

  String ceaserCipherProtocol() {
    StringBuffer protocol;
    protocol.write('zxw');
    int domainOrUser = random.nextInt(2);
    if (domainOrUser == 0)
      protocol.write('xd'); //xd -> use domain String
    else
      protocol.write('xu'); // xu -> use username String

    int letterPossition = random.nextInt(4);
    if (letterPossition == 0)
      protocol.write('ll'); //ll -> last letter
    else if (letterPossition == 1)
      protocol.write('fl'); //fl -> first letter
    else if (letterPossition == 2)
      protocol.write('sl'); //sl -> second letter
    else
      protocol.write('tl'); //tl -> third letter

    int ceasarWith = random.nextInt(3);
    if (ceasarWith == 0)
      protocol.write('cv'); //cv -> ceasar cipher with vowel
    else if (ceasarWith == 1)
      protocol.write('cc'); //cc -> ceasar cipher with consonant
    else
      protocol.write('ct'); //ct -> ceasar cipher with total count

    int capitalizeOrNot = random.nextInt(2);
    if (capitalizeOrNot == 0)
      protocol.write('nc'); //nc -> no capital
    else
      protocol.write('ca'); //ca -> capital all

    print(protocol.toString());
    return protocol.toString();
  }

  String countProtocol() {
    StringBuffer protocol;
    protocol.write('zxn');
    int domainOrUser = random.nextInt(2);
    if (domainOrUser == 0)
      protocol.write('xd'); //xd -> use domain String
    else
      protocol.write('xu'); // xu -> use username String

    int whichCountOne = random.nextInt(3);
    if (whichCountOne == 0)
      protocol.write('tc'); //tc -> total count
    else if (whichCountOne == 1)
      protocol.write('vc'); //vc -> vowel count
    else
      protocol.write('cc'); //cc -> consonant count

    int whichCountTwo = random.nextInt(3);
    if (whichCountTwo == 0)
      protocol.write('tc'); //tc -> total count
    else if (whichCountTwo == 1)
      protocol.write('vc'); //vc -> vowel count
    else
      protocol.write('cc'); //cc -> consonant count

    int whichOperation = random.nextInt(4);
    if (whichOperation == 0)
      protocol.write('x+'); //x+ -> operation should be positive
    else if (whichOperation == 1)
      protocol.write('x-'); //x- -> operation should be negative
    else if (whichOperation == 2)
      protocol.write('x*'); //x* -> operation should be multiply
    else
      protocol.write('x/'); //x/ -> operation should be divide

    int operationWith = random.nextInt(3);
    if (operationWith == 0)
      protocol.write('vc'); //vc -> vowel count
    else if (whichCountTwo == 1)
      protocol.write('tc'); //tc -> total count
    else
      protocol.write('cc'); //cc -> consonant count
    print(protocol.toString());
    return protocol.toString();
  }

  String squareProtocol() {
    StringBuffer protocol;
    protocol.write('zxn');
    int domainOrUser = random.nextInt(2);
    if (domainOrUser == 0)
      protocol.write('xd'); // xd -> domain is to be used
    else
      protocol.write('xu'); // xu -> username is to be used

    int whatToSquare = random.nextInt(3);
    if (whatToSquare == 0)
      protocol.write('st'); // st -> square the total length
    else if (whatToSquare == 1)
      protocol.write('sv'); // sv -> square the vowel count
    else
      protocol.write('sc'); // sc -> square the consonant count

    int whichOperation = random.nextInt(2);
    if (whichOperation == 0)
      protocol.write('x+'); // x+ -> use addition operation
    else
      protocol.write('x-'); // x- -> use negative operation

    int whichNumber = random.nextInt(3);
    if (whichNumber == 0)
      protocol.write('cc'); // cc -> consonant count
    else if (whichNumber == 1)
      protocol.write('tc'); //tc -> total count
    else
      protocol.write('vc'); // vc -> vowel count

    print(protocol.toString());
    return protocol.toString();
  }

  String insertBracketProtocol() {
    StringBuffer protocol;
    protocol.write('zxs');
    int domainOrUser = random.nextInt(2);
    if (domainOrUser == 0)
      protocol.write('xd'); // xd -> domain is to be used
    else
      protocol.write('xu'); // xu -> username is to be used

    int whichNumber = random.nextInt(3);
    if (whichNumber == 0)
      protocol.write('cc'); // cc -> consonant count
    else if (whichNumber == 1)
      protocol.write('tc'); //tc -> total count
    else
      protocol.write('vc'); // vc -> vowel count

    // int whichSymbol = random.nextInt(6);
    // if (whichSymbol == 0)
    //   protocol.write('x('); //x( -> '(' symbol should be inserted
    // else if (whichSymbol == 1)
    //   protocol.write('x)'); //x) -> ')' symbol should be inserted
    // else if (whichSymbol == 2)
    //   protocol.write('x{'); //x{ -> '{' symbol should be inserted
    // else if (whichSymbol == 2)
    //   protocol.write('x}'); //x} -> '}' symbol should be inserted
    // else if (whichSymbol == 2)
    //   protocol.write('x['); //x[ -> '[' symbol should be inserted
    // else
    //   protocol.write('x]'); //x] -> ']' symbol should be inserted

    print(protocol.toString());
    return protocol.toString();
  }

  String insertOperationProtocol() {
    StringBuffer protocol;
    protocol.write('zxs');
    int domainOrUser = random.nextInt(2);
    if (domainOrUser == 0)
      protocol.write('xd'); // xd -> domain is to be used
    else
      protocol.write('xu'); // xu -> username is to be used

    protocol.write('tc'); // tc -> total count

    int whichOperation = random.nextInt(4);
    if (whichOperation == 0)
      protocol.write('x+'); //x+ -> operation should be positive
    else if (whichOperation == 1)
      protocol.write('x-'); //x- -> operation should be negative
    else if (whichOperation == 2)
      protocol.write('x*'); //x* -> operation should be multiply
    else
      protocol.write('x/'); //x/ -> operation should be divide

    print(protocol.toString());
    return protocol.toString();
  }

  String twoUserNameChars() {
    StringBuffer protocol;
    protocol.write('zxwxu');

    int whichPosition = random.nextInt(3);
    if (whichPosition == 0)
      protocol.write('lf'); // lf -> last and first chars
    else if (whichPosition == 1)
      protocol.write('ft'); //ft -> first two chars
    else
      protocol.write('lt'); // lt -> last two chars

    int whatCharToCapitalize = random.nextInt(4);
    if (whatCharToCapitalize == 0)
      protocol.write('ca'); //ca -> capitalize all
    else if (whatCharToCapitalize == 1)
      protocol.write('cf'); //cf -> capitalize first char
    else if (whatCharToCapitalize == 2)
      protocol.write('cl'); //cl -> capitalize last char
    else
      protocol.write('nc'); //nc -> dont capitalize

    int reverseOrNot = random.nextInt(2);
    if (reverseOrNot == 0)
      protocol.write('xr'); //xr -> reverse
    else
      protocol.write('nr'); //nr -> not reverse

    print(protocol.toString());
    return protocol.toString();
  }

  String numToChars() {
    StringBuffer protocol;
    protocol.write('zxw');

    int domainOrUser = random.nextInt(2);
    if (domainOrUser == 0)
      protocol.write('xd'); // xd -> domain is to be used
    else
      protocol.write('xu'); // xu -> username is to be used

    int whichNumber = random.nextInt(3);
    if (whichNumber == 0)
      protocol.write('cc'); // cc -> consonant count
    else if (whichNumber == 1)
      protocol.write('tc'); //tc -> total count
    else
      protocol.write('vc'); // vc -> vowel count

    protocol.write('nw'); //nw -> number to words

    int whichPosition = random.nextInt(3);
    if (whichPosition == 0)
      protocol.write('lf'); // lf -> last and first chars
    else if (whichPosition == 1)
      protocol.write('ft'); //ft -> first two chars
    else
      protocol.write('lt'); // lt -> last two chars

    int whatCharToCapitalize = random.nextInt(4);
    if (whatCharToCapitalize == 0)
      protocol.write('ca'); //ca -> capitalize all
    else if (whatCharToCapitalize == 1)
      protocol.write('cf'); //cf -> capitalize first char
    else if (whatCharToCapitalize == 2)
      protocol.write('cl'); //cl -> capitalize last char
    else
      protocol.write('nc'); //nc -> dont capitalize

    int reverseOrNot = random.nextInt(2);
    if (reverseOrNot == 0)
      protocol.write('xr'); //xr -> reverse
    else
      protocol.write('nr'); //nr -> not reverse

    print(protocol.toString());
    return protocol.toString();
  }

  String vctMultipleVCT() {
    StringBuffer protocol;
    protocol.write('zxn');

    int domainOrUserOne = random.nextInt(2);
    if (domainOrUserOne == 0)
      protocol.write('xd'); // xd -> domain is to be used
    else
      protocol.write('xu'); // xu -> username is to be used

    int whichNumberOne = random.nextInt(3);
    if (whichNumberOne == 0)
      protocol.write('cc'); // cc -> consonant count
    else if (whichNumberOne == 1)
      protocol.write('tc'); //tc -> total count
    else
      protocol.write('vc'); // vc -> vowel count

    int whichOperation = random.nextInt(4);
    if (whichOperation == 0)
      protocol.write('x+'); //x+ -> operation should be positive
    else if (whichOperation == 1)
      protocol.write('x-'); //x- -> operation should be negative
    else
      protocol.write('x*'); //x* -> operation should be multiply

    int domainOrUserTwo = random.nextInt(2);
    if (domainOrUserTwo == 0)
      protocol.write('xd'); // xd -> domain is to be used
    else
      protocol.write('xu'); // xu -> username is to be used

    int whichNumberTwo = random.nextInt(3);
    if (whichNumberTwo == 0)
      protocol.write('cc'); // cc -> consonant count
    else if (whichNumberTwo == 1)
      protocol.write('tc'); //tc -> total count
    else
      protocol.write('vc'); // vc -> vowel count

    print(protocol.toString());
    return protocol.toString();
  }
}
