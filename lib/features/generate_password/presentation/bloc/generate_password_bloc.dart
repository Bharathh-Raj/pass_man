import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_man/features/generate_password/domain/use_cases/get_password.dart';

part 'generate_password_state.dart';
part 'generate_password_event.dart';

class GeneratePasswordBloc extends Bloc<GeneratePasswordEvent, GeneratePasswordState> {
  final GetPassword getPassword;

  GeneratePasswordBloc({@required this.getPassword}) : super(GeneratePasswordInitial());

  @override
  Stream<GeneratePasswordState> mapEventToState(GeneratePasswordEvent event) async* {
    if (event is GeneratePassword) yield* mapGeneratePasswordEventToState(event);
  }

  Stream<GeneratePasswordState> mapGeneratePasswordEventToState(GeneratePassword event) async* {
    getPassword.call(Params(domain: event.domainName, username: event.userName, protocol: null)); //TODO: Add protocol.
    // TODO: Complete this
  }
}
