part of 'protocol_bloc.dart';

abstract class ProtocolEvent extends Equatable {
  const ProtocolEvent();

  @override
  List<Object> get props => [];
}

class GetProtocol extends ProtocolEvent {}

class GenerateProtocol extends ProtocolEvent {}
