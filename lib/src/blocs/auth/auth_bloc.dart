import 'dart:async';

import 'package:bitronics_test/src/blocs/auth/auth_event.dart';
import 'package:bitronics_test/src/blocs/auth/auth_state.dart';
import 'package:bitronics_test/src/repositories/token_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final TokenRepository tokenRepository;
  AuthBloc({required this.tokenRepository}) : super(AuthUnauthenticated()){
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LogOut>(_onLoggedOut);
  }

  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    final bool hasToken = await tokenRepository.hasToken();
    print(hasToken);
    if(hasToken){
      emit(AuthAuthenticated());
    }else{
      emit(AuthUnauthenticated());
    }
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) async{
    emit(AuthLoading());
    print(event.accessToken);
    await tokenRepository.saveToken(event.accessToken);
    await tokenRepository.saveTokenType(event.tokenType);
    emit(AuthAuthenticated());
  }

  void _onLoggedOut(LogOut event, Emitter<AuthState> emit) async{
    await tokenRepository.deleteToken();
    emit(AuthUnauthenticated());
  }



}