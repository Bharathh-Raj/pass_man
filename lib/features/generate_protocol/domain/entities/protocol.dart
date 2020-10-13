import 'package:flutter/foundation.dart';

class Protocol {
  final String protocol;

  Protocol({@required this.protocol});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['Protocol'] = this.protocol;
    return map;
  }
}
