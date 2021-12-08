import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent{

}

class LoggedIn extends AuthEvent{
  final String accessToken;
  final String tokenType;
  LoggedIn({required this.accessToken, required this.tokenType});

  @override
  List<Object> get props => [accessToken, tokenType];
}


class LogOut extends AuthEvent{}


