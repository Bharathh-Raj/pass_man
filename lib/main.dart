import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_man/features/generate_protocol/presentation/pages/protocol_loading_page.dart';

import 'features/generate_password/presentation/pages/generate_password_page.dart';
import 'features/generate_protocol/presentation/bloc/protocol_bloc.dart';
import 'features/login/presentation/bloc/sign_in_bloc.dart';
import 'features/login/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      title: 'PassMan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
          BlocProvider<ProtocolBloc>(create: (context) => ProtocolBloc())
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignInBloc signInBloc = context.bloc<SignInBloc>();
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        if (state is CheckSignInState) {
          signInBloc.add(CheckSignInEvent());
          return Center(child: CircularProgressIndicator());
        } else if (state is SignInInitialState)
          return LoginPage(onPressedFunction: onPressedFunction(signInBloc));
        // else if (state is LoadingState)
        else if (state is GoogleSignInSuccessState) {
          print('Sign in success state');
          context.bloc<ProtocolBloc>().add(GetProtocol());
          return ProtocolLoadingPage();
        } else if (state is GoogleSignInFailureState)
          return _errorSheet(context: context, signInBloc: signInBloc, state: state);
        else if (state is GoogleSignOutFailureState)
          return GeneratePasswordPage(); //Todo: Is this enough?
        else
          return Center(child: CircularProgressIndicator());
      },
    );
    // return BlocBuilder<SignInBloc, SignInState>(
    //   builder: (context, state) {
    //     if (state is CheckSignInState) {
    //       signInBloc.add(CheckSignInEvent());
    //       return Center(child: CircularProgressIndicator());
    //     } else if (state is SignInInitialState)
    //       return LoginPage(onPressedFunction: onPressedFunction(signInBloc));
    //     else if (state is LoadingState)
    //       return Center(child: CircularProgressIndicator()); 4567
    //     else if (state is GoogleSignInSuccessState)
    //       return GeneratePasswordPage();
    //     else if (state is GoogleSignInFailureState)
    //       return _errorSheet(context: context, signInBloc: signInBloc, state: state);
    //     else if (state is GoogleSignOutFailureState) return GeneratePasswordPage(); //Todo: Is this enough?
    //   },
    // );
  }

  onPressedFunction(SignInBloc signInBloc) {
    signInBloc.add(GoogleSignInEvent());
  }

  // Widget _loadingSheet() {
  //   return Container(
  //       height: 200,
  //       width: double.infinity,
  //       child: Center(
  //         child: CircularProgressIndicator(),
  //       ));
  // }

  Widget _errorSheet({GoogleSignInFailureState state, BuildContext context, SignInBloc signInBloc}) {
    return AlertDialog(
      title: Text(state.errorTitle),
      content: Text(state.errorMessage),
      actions: [
        FlatButton(child: Text('Cancel'), onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop')),
        FlatButton(
          child: Text('Try Again'),
          onPressed: () => signInBloc.add(GoogleSignInEvent()),
        )
      ],
    );
  }
}
