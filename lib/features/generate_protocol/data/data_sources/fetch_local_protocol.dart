import 'package:dartz/dartz.dart';
import 'package:pass_man/core/error/failures.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FetchLocalProtocol {
  Future<Either<Failure, Protocol>> fetchLocalProtocol();
}

class FetchLocalProtocolImpl extends FetchLocalProtocol {
  @override
  Future<Either<Failure, Protocol>> fetchLocalProtocol() async {
    return Task(() => _getProtocol()).attempt().map((either) => either.leftMap((obj) => obj as LocalProtocolFaillure)).run();
  }

  Future<Protocol> _getProtocol() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String protocolStr = prefs.getString('protocol');
    if (protocolStr == null)
      throw LocalProtocolFaillure();
    else {
      Protocol protocol = new Protocol(protocol: protocolStr);
      print('Local Protocol Fetched😍😍');
      return protocol;
    }
  }
}
