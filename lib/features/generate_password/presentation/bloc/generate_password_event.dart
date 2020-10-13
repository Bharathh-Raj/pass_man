part of 'generate_password_bloc.dart';

abstract class GeneratePasswordEvent extends Equatable {
  @override
  List<Object> get props => null;
}

class GeneratePassword extends GeneratePasswordEvent {
  final String domainName;
  final String userName;
  GeneratePassword({@required this.domainName, @required this.userName});
}
