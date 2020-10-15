import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({this.message});
  @override
  List<Object> get props => [];
}

class FormatFailure extends Failure {
  FormatFailure({String message}) : super(message: message);
}

class ProtocolGenerationFailure extends Failure {
  ProtocolGenerationFailure({String message}) : super(message: message);
}

class PasswordGenerationFailure extends Failure {
  PasswordGenerationFailure({String message}) : super(message: message);
}

class LocalProtocolFaillure extends Failure {
  LocalProtocolFaillure({String message}) : super(message: message);
}

class UploadProtocolFailure extends Failure {
  UploadProtocolFailure({String message}) : super(message: message);
}

// class //TODO
class PlatformFailure extends Failure {
  PlatformFailure({String message}) : super(message: message);
}

class SocketFailure extends Failure {
  SocketFailure({String message}) : super(message: message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure({String message}) : super(message: message);
}
