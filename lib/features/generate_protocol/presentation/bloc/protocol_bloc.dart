import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pass_man/core/error/failures.dart';
import 'package:pass_man/features/generate_protocol/data/data_sources/fetch_local_protocol.dart';
import 'package:pass_man/features/generate_protocol/data/data_sources/fetch_remote_protocol.dart';
import 'package:pass_man/features/generate_protocol/data/data_sources/generate_protocol.dart';
import 'package:pass_man/features/generate_protocol/data/data_sources/save_protocol.dart';
import 'package:pass_man/features/generate_protocol/data/data_sources/upload_protocol.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';
import 'package:pass_man/features/login/data/data_sources/firebase_sign_in.dart';

part 'protocol_event.dart';
part 'protocol_state.dart';

class ProtocolBloc extends Bloc<ProtocolEvent, ProtocolState> {
  ProtocolBloc() : super(ProtocolInitial());

  @override
  Stream<ProtocolState> mapEventToState(
    ProtocolEvent event,
  ) async* {
    if (event is GetProtocol)
      yield* _getProtocol();
    else if (event is GenerateProtocol) yield* _generateProtocol();
  }

  Stream<ProtocolState> _getProtocol() async* {
    print('Loading...Protocol🤨');
    yield ProtocolLoading();
    Either<Failure, Protocol> protocol = await FetchLocalProtocolImpl().fetchLocalProtocol();

    yield* protocol.fold((failure) async* {
      print('local fetch failure...😪');
      protocol = await FetchRemoteProtocol().fetchRemoteProtocol(GoogleAuth.getUserEmail());
    }, (protocol) async* {
      print('Local fetch success...😍:' + protocol.protocol);
      yield ProtocolSuccessLocal(protocol: protocol);
      return;
    });

    if (protocol.isLeft())
      yield* protocol.fold((failure) async* {
        print('Remote fetch failure...😪');
        yield ProtocolFailure(failure: failure);
      }, (protocol) async* {
        if (protocol == null)
          yield ProtocolNotFound();
        else {
          await SaveProtocolImpl().saveProtocol(protocol: protocol);
          yield ProtocolSuccessRemote(protocol: protocol);
          print('Remote fetch success...😍');
        }
      });
  }

  Stream<ProtocolState> _generateProtocol() async* {
    yield ProtocolLoading();
    Protocol generatedProtocol;
    try {
      generatedProtocol = ProtocolDataSourceImpl().generateProtocol();
      print('Protocol Generation Successful😘😘');
    } catch (e) {
      yield ProtocolFailure(failure: ProtocolGenerationFailure(message: 'Protocol Generation Failed!'));
    }
    try {
      await SaveProtocolImpl().saveProtocol(protocol: generatedProtocol);
      await UploadProtocol()
          .uploadProtocol(docID: GoogleAuth.getUserEmail(), protocol: generatedProtocol); //TODO:Not properly handled either here!
      print('Protocol Upload Successful😘😘');
      yield ProtocolGenerationSuccess(protocol: generatedProtocol);
    } catch (e) {
      print('Protocol Upload failure😪😪');
      yield ProtocolFailure(failure: ProtocolGenerationFailure(message: 'Saving of protocol failed!'));
    }
    // upload.fold((failure) => , (r) async*{yield Pr});//TODO: Handle this
  }

  // FetchLocalProtocolImpl().fetchLocalProtocol().then((either) => either.fold((failure) async* {
  //       print('local fetch failure...😪');
  //       FetchRemoteProtocol().fetchRemoteProtocol(GoogleAuth.getUserEmail()).then((either) => either.fold((failure) async* {
  //             print('Remote fetch failure...😪');
  //             yield ProtocolFailure(failure: failure);
  //           }, (protocol) async* {
  //             if (protocol == null) yield ProtocolNotFound();
  //             print('Remote fetch success...😍');
  //             yield ProtocolSuccess(protocol: protocol);
  //           }));
  //     }, (protocol) async* {
  //       print('Local fetch success...😍');
  //       yield ProtocolSuccess(protocol: protocol);
  //     }));
}
