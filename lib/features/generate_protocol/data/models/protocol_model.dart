import 'package:flutter/foundation.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';

class ProtocolModel extends Protocol {
  final String protocol;

  ProtocolModel({@required this.protocol});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['Protocol'] = this.protocol;
    return map;
  }
}
