import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState{}

class LoginValidated extends LoginState{}

class LoginLoading extends LoginState{}

class LoginInputError extends LoginState{
    final bool isUsernameError;
    final bool isPasswordError;

    const LoginInputError({ required this.isPasswordError, required this.isUsernameError});

    @override
    List<Object> get props => [isUsernameError, isPasswordError];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}