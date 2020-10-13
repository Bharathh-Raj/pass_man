import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:pass_man/core/error/failures.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';

abstract class FetchRemoteProtocolAbstract {
  Future<Either<Failure, Protocol>> fetchRemoteProtocol();
}

class FetchRemoteProtocol implements FetchRemoteProtocolAbstract {
  @override
  Future<Either<Failure, Protocol>> fetchRemoteProtocol() {}

  Future<Protocol> getProtocol() async {
    // final firestore = Firestore.instance.collection('');//TODO
  }
}
