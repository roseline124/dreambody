import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'events.dart';
import 'states.dart';
import 'authRepository.dart';

// BLOC 에서 event랑 state를 generic으로 받고
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;  // 하나의 repository 생성

  AuthenticationBloc({@required this.authRepository})
      : assert(authRepository != null), // it is function for debugging.
        super(null);

  @override
  AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {
      //토큰 빼오기
      final bool hasToken = authRepository.hasToken();

      //토큰을 가지고 있을 경우
      if (hasToken) {
        yield AuthenticationSuccess();
      } else {
        yield AuthenticationFailure();
      }
    }

    if (event is AuthenticationLoggedIn) {
      yield AuthenticationInProgress();
      authRepository.saveToken(token: event.token);
      yield AuthenticationSuccess();
    }

    if (event is AuthenticationLoggedOut) {
      yield AuthenticationInProgress();
      authRepository.deleteToken();
      yield AuthenticationFailure();
    }
  }
}
