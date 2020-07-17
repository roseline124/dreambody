import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String token;

  const LoginButtonPressed({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoginButtonPressed { token: $token }';
}
