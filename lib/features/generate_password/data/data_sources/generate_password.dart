import 'package:flutter/foundation.dart';
import 'package:pass_man/features/generate_password/data/data_sources/capitalize.dart';
import 'package:pass_man/features/generate_password/data/data_sources/ceaser_cipher.dart';
import 'package:pass_man/features/generate_password/data/data_sources/gather_characters.dart';
import 'package:pass_man/features/generate_password/data/data_sources/gather_single_character.dart';
import 'package:pass_man/features/generate_password/data/data_sources/gather_two_chars.dart';
import 'package:pass_man/features/generate_password/data/data_sources/num_of_vow_cons.dart';
import 'package:pass_man/features/generate_password/data/data_sources/num_to_words.dart';
import 'package:pass_man/features/generate_password/data/data_sources/reverse.dart';

class GeneratePassword {
  final String domain;
  final String username;
  final String protocol = 'zxwxdpecenrzxwxdflcvnczxnxdccx*cczxnxusvx+cczxsxdvcx{zxsxdtcx+zxwxulfclnrzxwxutcnwltcaxrzxnxdvcx-xucc';

  int numOfVowOnDomain;
  int numOfVowOnUser;
  int numOfConsOnDomain;
  int numOfConsOnUser;

  GeneratePassword({@required this.domain, @required this.username}) {
    numOfVowOnDomain = numOfVowelsIn(str: domain);
    numOfVowOnUser = numOfVowelsIn(str: username);
    numOfConsOnDomain = numOfConsonantsIn(str: domain);
    numOfConsOnUser = numOfConsonantsIn(str: username);

    computePassword();
  }

  String computePassword() {
    StringBuffer password = new StringBuffer();
    List<String> seperatedProtocol = splitProtocol(protocol);
    // print('❤❤❤❤❤');
    password.write(shrinkTheDomain(splitSubProtocol(seperatedProtocol, 0)));
    // print("1:" + password.toString());
    password.write(ceaserCipherProtocol(splitSubProtocol(seperatedProtocol, 1)));
    // print("2:" + password.toString());
    password.write(countProtocol(splitSubProtocol(seperatedProtocol, 2)));
    // print("3:" + password.toString());
    password.write(squareProtocol(splitSubProtocol(seperatedProtocol, 3)));
    // print("4:" + password.toString());
    password.write(insertBracketProtocol(splitSubProtocol(seperatedProtocol, 4)));
    // print("5:" + password.toString());
    password.write(insertOperationProtocol(splitSubProtocol(seperatedProtocol, 5)));
    // print("6:" + password.toString());
    password.write(twoUsernameCharsProtocol(splitSubProtocol(seperatedProtocol, 6)));
    // print("7:" + password.toString());
    password.write(numToCharsProtocol(splitSubProtocol(seperatedProtocol, 7)));
    // print("8:" + password.toString());
    password.write(vctMultipleVCT(splitSubProtocol(seperatedProtocol, 8)));
    // print("9:" + password.toString());
    return password.toString();
  }

  List<String> splitProtocol(String protocol) {
    List<String> seperatedProtocol = protocol.split('z');
    seperatedProtocol.removeAt(0);
    return seperatedProtocol;
  }

  List<String> splitSubProtocol(List<String> seperatedProtocol, int index) {
    List<String> tempo = new List<String>();
    for (int i = 0; i < seperatedProtocol[index].length; i += 2) {
      tempo.add(seperatedProtocol[index].substring(i, i + 2));
    }
    print('splitSubProtocol :' + tempo.toString());
    return tempo;
  }

  String shrinkTheDomain(List<String> subProtocolOne) {
    String parsedString;
    if (subProtocolOne[2] == 'po')
      parsedString = GatherCharacters.gatherOddCharacters(str: domain);
    else
      parsedString = GatherCharacters.gatherEvenCharacters(str: domain);

    String capitalizedString;
    if (subProtocolOne[3] == 'co')
      capitalizedString = Capitalize.capitalizeOddCharacters(str: parsedString);
    else if (subProtocolOne[3] == 'ce')
      capitalizedString = Capitalize.capitalizeEvenCharacters(str: parsedString);
    else
      capitalizedString = Capitalize.capitalizeAllCharacters(str: parsedString);

    String reversedString;
    if (subProtocolOne[4] == 'xr')
      reversedString = Reverse.reverse(str: capitalizedString);
    else
      reversedString = capitalizedString;
    return reversedString;
  }

  String ceaserCipherProtocol(List<String> subProtocolTwo) {
    String domainOrUser;
    if (subProtocolTwo[1] == 'xd')
      domainOrUser = domain;
    else
      domainOrUser = username;

    String gatheredCharacter;
    if (subProtocolTwo[2] == 'll')
      gatheredCharacter = GatherSingleCharacter.lastLetter(str: domainOrUser);
    else if (subProtocolTwo[2] == 'fl')
      gatheredCharacter = GatherSingleCharacter.firstLetter(str: domainOrUser);
    else if (subProtocolTwo[2] == 'sl')
      gatheredCharacter = GatherSingleCharacter.secondLetter(str: domainOrUser);
    else
      gatheredCharacter = GatherSingleCharacter.thirdLetter(str: domainOrUser);

    int vowOrConOrTotCount;
    if (subProtocolTwo[3] == 'cv')
      vowOrConOrTotCount = numOfVowelsIn(str: domainOrUser);
    else if (subProtocolTwo[3] == 'cc')
      vowOrConOrTotCount = numOfConsonantsIn(str: domainOrUser);
    else
      vowOrConOrTotCount = domainOrUser.length;

    String cipheredString = CeaserCipher.ceaserCipherAWord(str: gatheredCharacter, key: vowOrConOrTotCount);

    if (subProtocolTwo[4] == 'nc')
      return cipheredString;
    else
      return Reverse.reverse(str: cipheredString);
  }

  String countProtocol(List<String> subProtocolThree) {
    String domainOrUser;
    if (subProtocolThree[1] == 'xd')
      domainOrUser = domain;
    else
      domainOrUser = username;

    print(domainOrUser);
    int countOne;
    if (subProtocolThree[2] == 'tc')
      countOne = domainOrUser.length;
    else if (subProtocolThree[2] == 'vc')
      countOne = numOfVowelsIn(str: domainOrUser);
    else
      countOne = numOfConsonantsIn(str: domainOrUser);
    print(countOne.toString());

    int countTwo;
    if (subProtocolThree[4] == 'tc')
      countTwo = domainOrUser.length;
    else if (subProtocolThree[4] == 'vc')
      countTwo = numOfVowelsIn(str: domainOrUser);
    else
      countTwo = numOfConsonantsIn(str: domainOrUser);
    print(countTwo.toString());

    if (subProtocolThree[3] == 'x+')
      return (countOne + countTwo).toString();
    else if (subProtocolThree[3] == 'x-')
      return (countOne - countTwo).toString();
    else if (subProtocolThree[3] == 'x*')
      return (countOne * countTwo).toString();
    else
      return (countOne / countTwo).toString();
  }

  String squareProtocol(List<String> subProtocolFour) {
    String domainOrUser;
    if (subProtocolFour[1] == 'xd')
      domainOrUser = domain;
    else
      domainOrUser = username;

    int squaredNumber;
    if (subProtocolFour[2] == 'st') {
      int length = domainOrUser.length;
      squaredNumber = length * length;
    } else if (subProtocolFour[2] == 'sv') {
      int vowelCount = numOfVowelsIn(str: domainOrUser);
      squaredNumber = vowelCount * vowelCount;
    } else {
      int consonantCount = squaredNumber = numOfConsonantsIn(str: domainOrUser);
      squaredNumber = consonantCount * consonantCount;
    }

    int count;
    if (subProtocolFour[4] == 'tc')
      count = domainOrUser.length;
    else if (subProtocolFour[4] == 'vc')
      count = numOfVowelsIn(str: domainOrUser);
    else
      count = numOfConsonantsIn(str: domainOrUser);

    if (subProtocolFour[3] == 'x+')
      return (squaredNumber + count).toString();
    else
      return (squaredNumber - count).toString();
  }

  String insertBracketProtocol(List<String> subProtocolFive) {
    String domainOrUser;
    if (subProtocolFive[1] == 'xd')
      domainOrUser = domain;
    else
      domainOrUser = username;

    int upperBound;
    if (subProtocolFive[2] == 'tc')
      upperBound = 3;
    else if (subProtocolFive[2] == 'vc')
      upperBound = 1;
    else
      upperBound = 2;

    for (int i = 1; i < 7; i++) {
      if (domainOrUser.length < upperBound * i) {
        if (i == 1)
          return '(';
        else if (i == 2)
          return ')';
        else if (i == 3)
          return '{';
        else if (i == 4)
          return '}';
        else if (i == 5)
          return '[';
        else
          return ']';
      }
    }
    return ']';
  }

  String insertOperationProtocol(List<String> subProtocolSix) {
    String domainOrUser;
    if (subProtocolSix[1] == 'xd')
      domainOrUser = domain;
    else
      domainOrUser = username;

    if (domainOrUser.length < 3)
      return '+';
    else if (domainOrUser.length < 6)
      return '-';
    else if (domainOrUser.length < 9)
      return '*';
    else
      return '/';
  }

  String twoUsernameCharsProtocol(List<String> subProtocolSeven) {
    //TODO: can add doamin or username
    String twoChars;
    if (subProtocolSeven[2] == 'lf')
      twoChars = GatherTwoChars.firstAndLast(str: username);
    else if (subProtocolSeven[2] == 'ft')
      twoChars = GatherTwoChars.firstTwo(str: username);
    else
      twoChars = GatherTwoChars.lastTwo(str: username);

    String capitalizedChars;
    if (subProtocolSeven[3] == 'ca')
      capitalizedChars = Capitalize.capitalizeAllCharacters(str: twoChars);
    else if (subProtocolSeven[3] == 'cf')
      capitalizedChars = Capitalize.capitalizeFirstCharacter(str: twoChars);
    else if (subProtocolSeven[3] == 'cl')
      capitalizedChars = Capitalize.capitalizeLastCharacter(str: twoChars);
    else
      capitalizedChars = twoChars;

    String reversedChars;
    if (subProtocolSeven[4] == 'xr')
      reversedChars = Reverse.reverse(str: capitalizedChars);
    else
      reversedChars = capitalizedChars;

    return reversedChars;
  }

  String numToCharsProtocol(List<String> subProtocolEight) {
    String domainOrUser;
    if (subProtocolEight[1] == 'xd')
      domainOrUser = domain;
    else
      domainOrUser = username;

    int count;
    if (subProtocolEight[2] == 'tc')
      count = domainOrUser.length;
    else if (subProtocolEight[2] == 'vc')
      count = numOfVowelsIn(str: domainOrUser);
    else
      count = numOfConsonantsIn(str: domainOrUser);

    String numToWord = numToWords(number: count);

    String twoChars;
    if (subProtocolEight[4] == 'lf')
      twoChars = GatherTwoChars.firstAndLast(str: numToWord);
    else if (subProtocolEight[4] == 'ft')
      twoChars = GatherTwoChars.firstTwo(str: numToWord);
    else
      twoChars = GatherTwoChars.lastTwo(str: numToWord);

    String capitalizedChars;
    if (subProtocolEight[5] == 'ca')
      capitalizedChars = Capitalize.capitalizeAllCharacters(str: twoChars);
    else if (subProtocolEight[5] == 'cf')
      capitalizedChars = Capitalize.capitalizeFirstCharacter(str: twoChars);
    else if (subProtocolEight[5] == 'cl')
      capitalizedChars = Capitalize.capitalizeLastCharacter(str: twoChars);
    else
      capitalizedChars = twoChars;

    String reversedChars;
    if (subProtocolEight[6] == 'xr')
      reversedChars = Reverse.reverse(str: capitalizedChars);
    else
      reversedChars = capitalizedChars;

    return reversedChars;
  }

  String vctMultipleVCT(List<String> subProtocolNine) {
    String domainOrUserOne;
    if (subProtocolNine[1] == 'xd')
      domainOrUserOne = domain;
    else
      domainOrUserOne = username;

    int countOne;
    if (subProtocolNine[2] == 'tc')
      countOne = domainOrUserOne.length;
    else if (subProtocolNine[2] == 'vc')
      countOne = numOfVowelsIn(str: domainOrUserOne);
    else
      countOne = numOfConsonantsIn(str: domainOrUserOne);

    String domainOrUserTwo;
    if (subProtocolNine[4] == 'xd')
      domainOrUserTwo = domain;
    else
      domainOrUserTwo = username;

    int countTwo;
    if (subProtocolNine[5] == 'tc')
      countTwo = domainOrUserTwo.length;
    else if (subProtocolNine[5] == 'vc')
      countTwo = numOfVowelsIn(str: domainOrUserTwo);
    else
      countTwo = numOfConsonantsIn(str: domainOrUserTwo);

    if (subProtocolNine[3] == 'x+')
      return (countOne + countTwo).toString();
    else if (subProtocolNine[3] == 'x-')
      return (countOne - countTwo).toString();
    else
      return (countOne * countTwo).toString();
  }
}
