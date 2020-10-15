import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:pass_man/core/error/failures.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';

abstract class FetchRemoteProtocolAbstract {
  Future<Either<Failure, Protocol>> fetchRemoteProtocol(String docID);
}

class FetchRemoteProtocol implements FetchRemoteProtocolAbstract {
  @override
  Future<Either<Failure, Protocol>> fetchRemoteProtocol(String docID) async {
    //! It gives error when exception other than socketException and Platform Exception Occured.
    return Task(() => _getProtocol(docID)).attempt().map((either) => either.leftMap((obj) => obj as Failure)).run();
  }

  Future<Protocol> _getProtocol(String docID) async {
    final firestore = FirebaseFirestore.instance.collection('Protocol');
    try {
      DocumentSnapshot protocolDoc = await firestore.doc(docID).get();
      // if (protocolDoc == null) return null;
      if (protocolDoc.exists == true)
        return Protocol(protocol: protocolDoc.data()['protocol']);
      else
        return null;
      // return Protocol(protocol: protocolDoc.data()['protocol']);
    } catch (e) {
      if (e is PlatformException) //!Should i check paltform exception?
        throw PlatformFailure(message: e.message);
      else if (e is SocketException)
        throw SocketFailure(message: e.message);
      else if (e is FirebaseException)
        throw FirebaseFailure(message: e.message);
      else
        throw e;
    }
  }
}
