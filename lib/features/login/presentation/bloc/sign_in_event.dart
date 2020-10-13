part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => null;
}

class CheckSignInEvent extends SignInEvent {}

class GoogleSignInEvent extends SignInEvent {}

class GoogleSignOutEvent extends SignInEvent {}
