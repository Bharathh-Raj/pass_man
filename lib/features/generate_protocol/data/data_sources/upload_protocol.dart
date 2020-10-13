import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pass_man/core/error/failures.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';

abstract class UploadProtocolAbstract {
  Future<Either<Failure, void>> uploadProtocol({@required String uid, @required Protocol protocol});
}

class UploadProtocol implements UploadProtocolAbstract {
  final CollectionReference firebaseProtocol = FirebaseFirestore.instance.collection('Protocol');
  @override
  Future<Either<Failure, void>> uploadProtocol({@required String uid, @required Protocol protocol}) async {
    return await Task(() => _uploadProtocol(uid: uid, protocol: protocol))
        .attempt()
        .map((either) => either.leftMap((obj) => obj as Failure))
        .run();
  }

  Future<void> _uploadProtocol({@required String uid, @required Protocol protocol}) async {
    try {
      await firebaseProtocol.doc(uid).set(protocol.toJson());
    } catch (e) {
      if (e is PlatformException)
        throw PlatformFailure(message: e.message);
      else if (e is SocketException)
        throw SocketFailure(message: e.message);
      else
        throw e;
    }
  }
}
