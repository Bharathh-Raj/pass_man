import 'package:pass_man/features/generate_password/domain/entities/password.dart';
import 'package:pass_man/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pass_man/features/generate_password/domain/repositories/password_repository.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';
import 'package:pass_man/features/generate_password/data/data_sources/generate_password.dart';

class PasswordRepositoryImplementation implements PasswordRepository {
  @override
  Either<Failure, Password> getPassword({String domain, String username, Protocol protocol}) {
    // TODO: implement getPassword
    PasswordDataSourceImpl passwordObj = new PasswordDataSourceImpl(domain: domain, username: username, protocol: protocol.protocol);
    Either<Failure, Password> password = passwordObj.computePassword();
    // throw UnimplementedError();
    return password;
  }
}
