import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginSucceed extends LoginEvent {
  final String token;

  const LoginSucceed({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoginSucceed { token: $token }';
}
