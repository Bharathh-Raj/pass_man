part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object> get props => null;
}

class CheckSignInState extends SignInState {}

class SignInInitialState extends SignInState {}

class LoadingState extends SignInState {}

class GoogleSignInSuccessState extends SignInState {
  final User user;

  GoogleSignInSuccessState({this.user});
}

class GoogleSignInFailureState extends SignInState {
  final SignInErrorCode errorCode;
  final String errorTitle;
  final String errorMessage;

  GoogleSignInFailureState({this.errorCode, this.errorTitle, this.errorMessage});
}

class GoogleSignOutFailureState extends SignInState {}
