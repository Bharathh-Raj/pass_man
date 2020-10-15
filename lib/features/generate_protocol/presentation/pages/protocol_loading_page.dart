import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_man/features/generate_password/presentation/pages/generate_password_page.dart';
import 'package:pass_man/features/generate_protocol/presentation/bloc/protocol_bloc.dart';

class ProtocolLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProtocolBloc, ProtocolState>(
      builder: (context, state) {
        if (state is ProtocolSuccessLocal) {
          print('Protocol is loaded successfully from local😘😘:' + state.protocol.protocol);
          return GeneratePasswordPage();
        } else if (state is ProtocolSuccessRemote) {
          print('Protocol is loaded successfully from remote😘😘:' + state.protocol.protocol);
          return GeneratePasswordPage();
        } else if (state is ProtocolGenerationSuccess) {
          print('Protocol generation is successfull!😘😘:' + state.protocol.protocol);
          return GeneratePasswordPage();
        } else if (state is ProtocolNotFound) {
          // context.bloc<GenerateProtocol>().add//TODO:
          context.bloc<ProtocolBloc>().add(GenerateProtocol());
          return Text('Not found protocol');
        } else if (state is ProtocolFailure)
          return AlertDialog(
            title: Text('Error retrieving/generating protocol!'),
            content: Text(state.failure.message),
            actions: [FlatButton(onPressed: () => context.bloc<ProtocolBloc>().add(GetProtocol()), child: Text('Try Again!'))],
          );
        else if (state is ProtocolInitial || state is ProtocolLoading)
          return Center(
            child: Container(color: Colors.white, child: CircularProgressIndicator()),
          );
      },
    );
  }
}
