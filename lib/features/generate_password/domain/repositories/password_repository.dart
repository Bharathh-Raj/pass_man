import 'package:dartz/dartz.dart';
import 'package:pass_man/core/error/failures.dart';
import 'package:pass_man/features/generate_password/domain/entities/password.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';

abstract class PasswordRepository {
  Either<Failure, Password> getPassword({String domain, String username, Protocol protocol});
}
