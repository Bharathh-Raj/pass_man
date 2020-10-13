import 'package:flutter/foundation.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SaveProtocol {
  void saveProtocol({@required Protocol protocol});
}

class SaveProtocolImpl extends SaveProtocol {
  Future<void> saveProtocol({@required Protocol protocol}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String proto = protocol.protocol;
    await prefs.setString('protocol', proto);
  }
}
