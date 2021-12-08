import 'package:bitronics_test/src/blocs/auth/auth_bloc.dart';
import 'package:bitronics_test/src/blocs/auth/auth_event.dart';
import 'package:bitronics_test/src/blocs/auth/auth_state.dart';
import 'package:bitronics_test/src/repositories/token_repository.dart';
import 'package:bitronics_test/src/screens/balance/balance_screen.dart';
import 'package:bitronics_test/src/screens/login/login_form.dart';
import 'package:bitronics_test/src/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final TokenRepository tokenRepository = TokenRepository();

  runApp(
    BlocProvider(create: (context){
      return AuthBloc(tokenRepository: tokenRepository);
    },
    child: MyApp(tokenRepository: tokenRepository,))
  );
}

class MyApp extends StatelessWidget {
  final TokenRepository tokenRepository;
  const MyApp({Key? key, required this.tokenRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocBuilder<AuthBloc, AuthState>  (builder: (context, state){
        BlocProvider.of<AuthBloc>(context).add(AppStarted());
        if(state is AuthUnauthenticated){
          return LoginScreen();
        }
        if(state is AuthAuthenticated){
          return BalanceScreen();
        }
        if(state is AuthLoading){
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
        return const Scaffold(
          body: CircularProgressIndicator(),
        );
      })
    );
  }
}
