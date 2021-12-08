import 'dart:async';

import 'package:bitronics_test/src/blocs/auth/auth_bloc.dart';
import 'package:bitronics_test/src/blocs/auth/auth_event.dart';
import 'package:bitronics_test/src/blocs/login/login_event.dart';
import 'package:bitronics_test/src/blocs/login/login_state.dart';
import 'package:bitronics_test/src/network/providers/auth_provider.dart';
import 'package:bitronics_test/src/screens/login/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final AuthBloc authBloc;
  final AuthProvider authProvider;
  bool isUsernameError = false;
  bool isPasswordError = false;

  LoginBloc({required this.authBloc, required this.authProvider}) : super(LoginInitial()){
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<PasswordChanged>(_onPasswordChanged);
    on<UsernameChanged>(_onUsernameChanged);
  }

  _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async{
    emit(LoginLoading());
    try{
      final userResponse = await authProvider.login(event.username, event.password);
      if(userResponse.status == false){
        emit(const LoginFailure(error: "Login failed"));
      }else{
        authBloc.add(LoggedIn(accessToken: userResponse.user!.accessToken, tokenType: userResponse.user!.tokenType));
      }
    }catch(error){
      emit(LoginFailure(error: error.toString()));
    }
  }

  _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit){
    if(!Validators.isValidPassword(event.password)){
      isPasswordError = true;
    }else{
      isPasswordError = false;
      if(isUsernameError == false){
        emit(LoginValidated());
        return;
      }else{
        emit(LoginInputError(isPasswordError: isPasswordError, isUsernameError: isUsernameError));
      }
    }
    emit(LoginInputError(isPasswordError: isPasswordError, isUsernameError: isUsernameError));
  }

  _onUsernameChanged(UsernameChanged event, Emitter<LoginState> emit){
    if(!Validators.isValidUsername(event.username)){
      isUsernameError = true;
    }else{
      isUsernameError = false;
      if(isPasswordError == false) {
        emit(LoginValidated());
        return;
      }
    }
    emit(LoginInputError(isPasswordError: isPasswordError, isUsernameError: isUsernameError));
  }

}