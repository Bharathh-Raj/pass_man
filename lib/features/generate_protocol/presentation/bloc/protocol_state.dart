part of 'protocol_bloc.dart';

abstract class ProtocolState extends Equatable {
  const ProtocolState();

  @override
  List<Object> get props => [];
}

class ProtocolInitial extends ProtocolState {}

class ProtocolLoading extends ProtocolState {}

class ProtocolSuccessLocal extends ProtocolState {
  final Protocol protocol;

  ProtocolSuccessLocal({@required this.protocol});
}

class ProtocolSuccessRemote extends ProtocolState {
  final Protocol protocol;

  ProtocolSuccessRemote({@required this.protocol});
}

class ProtocolFailure extends ProtocolState {
  final Failure failure;

  ProtocolFailure({@required this.failure});
}

class ProtocolNotFound extends ProtocolState {}

class ProtocolGenerationSuccess extends ProtocolState {
  final Protocol protocol;

  ProtocolGenerationSuccess({@required this.protocol});
}

// class ProtocolGenerationFailure extends ProtocolState {}
