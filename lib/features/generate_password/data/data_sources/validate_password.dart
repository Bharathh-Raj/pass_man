class ValidatePassword {
  static String removeSpace(String password) {
    if (password.contains(' ')) return password.split(' ').join();
    return password;
  }

  static String convertToLowerCase(String password) {
    return password.toLowerCase();
  }

  static String removeProtocol(String password) {
    if (password.startsWith('https://'))
      return password.substring(8);
    else if (password.startsWith('http://'))
      return password.substring(7);
    else if (password.startsWith('ws://'))
      return password.substring(5);
    else if (password.startsWith('wss://')) return password.substring(6);
    return password;
  }

  static String removeWWW(String password) {
    if (password.startsWith('www.') || password.startsWith('WWW.')) return password.substring(4);
    return password;
  }

  // static String removePathWithExtension(String password){
  //   if(password.contains('/')){
  //     List<String> dotSplit = password.split('.');
  //     dotSplit.removeAt(dotSplit.length-1);
  //     return dotSplit.toString();
  //   }
  //   return password;
  // }

  static String removeExtensionWithSubDomain(String password) {
    if (password.contains('.')) {
      List<String> dotSplit = password.split('.');
      return dotSplit[dotSplit.length - 2];
    }
    return password;
  }
}
// reg='^((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)\/)([\w\-\.]+[^#?\s]+)(.)?(#[\w\-]+)?$'
