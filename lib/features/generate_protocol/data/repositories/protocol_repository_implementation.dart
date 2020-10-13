import 'package:dartz/dartz.dart';
import 'package:pass_man/core/error/failures.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';
import 'package:pass_man/features/generate_protocol/domain/repositories/protocol_repository.dart';

class ProtocolRepositoryImplementation extends ProtocolRepository {
  @override
  Either<Failure, Protocol> generateProtocol() {
    // TODO: implement generateProtocol
    throw UnimplementedError();
  }

  @override
  // TODO: implement protocol
  Either<Failure, Protocol> get protocol => throw UnimplementedError();
}
