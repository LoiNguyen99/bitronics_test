import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class UsernameChanged extends LoginEvent{
  final String username;

  const UsernameChanged({required this.username});

  @override
  List<Object> get props => [username];
}

class PasswordChanged extends LoginEvent{
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}
