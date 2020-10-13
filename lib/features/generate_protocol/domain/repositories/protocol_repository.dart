import 'package:dartz/dartz.dart';
import 'package:pass_man/core/error/failures.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';

abstract class ProtocolRepository {
  Either<Failure, Protocol> generateProtocol();
  Either<Failure, Protocol> get protocol;
}
