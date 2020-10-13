part of 'generate_password_bloc.dart';

abstract class GeneratePasswordState extends Equatable {
  @override
  List<Object> get props => null;
}

class GeneratePasswordInitial extends GeneratePasswordState {}

class PasswordSuccess extends GeneratePasswordState {
  final String password;

  PasswordSuccess({@required this.password});
}

class ProtocolFailure extends GeneratePasswordState {
  final String title;
  final String message;

  ProtocolFailure(this.title, this.message);
}

class FormatFailure extends GeneratePasswordState {
  final String title;
  final String message;

  FormatFailure(this.title, this.message);
}
