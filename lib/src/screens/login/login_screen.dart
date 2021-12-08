import 'package:bitronics_test/src/blocs/auth/auth_bloc.dart';
import 'package:bitronics_test/src/blocs/auth/auth_state.dart';
import 'package:bitronics_test/src/blocs/login/login_bloc.dart';
import 'package:bitronics_test/src/network/providers/auth_provider.dart';
import 'package:bitronics_test/src/screens/login/login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider(create: (context){
          return LoginBloc(authBloc: BlocProvider.of<AuthBloc>(context), authProvider: AuthProvider());
        }, child: LoginForm(),)
    );
  }
}
