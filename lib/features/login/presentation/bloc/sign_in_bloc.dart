import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/data_sources/firebase_sign_in.dart';
import '../../data/data_sources/sign_in_error_code.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final GoogleAuth _auth = new GoogleAuth();

  SignInBloc() : super(CheckSignInState());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is CheckSignInEvent)
      yield* mapCheckSignInEventToState();
    else if (event is GoogleSignInEvent)
      yield* mapGoogleSignInEventToState();
    else if (event is GoogleSignOutEvent) yield* mapGoogleSignOutEventToState();
  }

  Stream<SignInState> mapCheckSignInEventToState() async* {
    yield LoadingState();
    final User _user = _auth.getUser();
    if (_user == null)
      yield SignInInitialState();
    else
      yield GoogleSignInSuccessState(user: _user);
  }

  Stream<SignInState> mapGoogleSignInEventToState() async* {
    yield LoadingState();
    try {
      UserCredential userCredential = await _auth.signInWithGoogle();
      print("❤❤❤" + userCredential.user.email);

      yield GoogleSignInSuccessState(user: userCredential.user);
    } catch (e) {
      if (e is PlatformException && e.code == GoogleSignIn.kNetworkError) {
        print('❌❌❌Network error!');
        yield GoogleSignInFailureState(
            errorCode: SignInErrorCode.NETWORK_ERROR,
            errorTitle: 'Network Error!',
            errorMessage: 'Please make sure you\'re connected to the internet');
      } else if (e is PlatformException && e.code == GoogleSignIn.kSignInCanceledError) {
        print('❌❌❌Cancelled error!');
        yield GoogleSignInFailureState(
            errorCode: SignInErrorCode.USER_CANCELLED, errorTitle: 'SignIn Cancelled!', errorMessage: 'Do you want me to try again?');
      } else if (e is PlatformException && e.code == GoogleSignIn.kSignInFailedError) {
        yield GoogleSignInFailureState(
            errorCode: SignInErrorCode.SIGN_IN_FAILED, errorTitle: 'SignIn Failed!', errorMessage: 'Do you want me to try again?');
      } else if (e is PlatformException && e.code == GoogleSignIn.kSignInRequiredError) {
        yield GoogleSignInFailureState(
            errorCode: SignInErrorCode.SIGN_IN_REQUIRED,
            errorTitle: 'SignIn Required!',
            errorMessage: 'Please make sure you\'ve atleast one Google account on this device');
      }
    }
  }

  Stream<SignInState> mapGoogleSignOutEventToState() async* {
    yield LoadingState();
    final User _user = _auth.getUser();
    try {
      if (_user != null) {
        _auth.signOutWithGoogle();
        yield SignInInitialState();
      } else
        yield SignInInitialState();
    } catch (e) {
      yield GoogleSignOutFailureState();
    }
  }
}
