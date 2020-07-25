import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../auth/authRepository.dart';
import '../auth/authBloc.dart';
import '../auth/events.dart';
import './events.dart';
import './states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.authRepository,
    @required this.authenticationBloc,
  })  : assert(authRepository != null),
        assert(authenticationBloc != null),
        super(null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSucceed) {
      yield LoginInProgress();

      try {
        authenticationBloc.add(AuthenticationLoggedIn(token: event.token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
