import 'package:equatable/equatable.dart';

class Password extends Equatable {
  final String password;

  Password({this.password});

  @override
  List<Object> get props => [password];
}
