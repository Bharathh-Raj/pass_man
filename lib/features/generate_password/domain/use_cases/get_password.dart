import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pass_man/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pass_man/core/usecases/use_case.dart';
import 'package:pass_man/features/generate_password/domain/entities/password.dart';
import 'package:pass_man/features/generate_password/domain/repositories/password_repository.dart';
import 'package:pass_man/features/generate_protocol/domain/entities/protocol.dart';

class GetPassword implements UseCase<Password, Params> {
  final PasswordRepository repository;

  GetPassword({this.repository});
  @override
  Either<Failure, Password> call(Params params) {
    return repository.getPassword(domain: params.domain, username: params.username, protocol: params.protocol);
  }
}

class Params extends Equatable {
  final String domain;
  final String username;
  final Protocol protocol;

  Params({@required this.domain, @required this.username, @required this.protocol});

  @override
  List<Object> get props => throw UnimplementedError();
}
