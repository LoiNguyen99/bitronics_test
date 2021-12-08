import 'package:bitronics_test/src/blocs/login/login_bloc.dart';
import 'package:bitronics_test/src/blocs/login/login_event.dart';
import 'package:bitronics_test/src/blocs/login/login_state.dart';
import 'package:bitronics_test/src/network/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePass = true;

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPress() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text));
    }

    _onUsernameChanged() {
      BlocProvider.of<LoginBloc>(context)
          .add(UsernameChanged(username: _usernameController.text));
    }

    _onPasswordChanged() {
      BlocProvider.of<LoginBloc>(context)
          .add(PasswordChanged(password: _passwordController.text));
    }

    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailure) {
        print(state.error);
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {

      return Center(
          child: state is LoginLoading ? CircularProgressIndicator() : Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: SvgPicture.asset('assets/icons/Eternalwallet_logo.svg',
                    height: 72, width: 72)),
            const Text(
              'Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _usernameController,
              onChanged: (text) {
                _onUsernameChanged();
              },
              decoration: const InputDecoration(
                hintText: "Email or Phone",
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                ),
              ),
            ),
            inputErrorTextWidget(
                state is LoginInputError && state.isUsernameError,
                "text error",
                8.0),
            TextField(
              controller: _passwordController,
              onChanged: (text) {
                _onPasswordChanged();
              },
              obscureText: _hidePass,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _hidePass = !_hidePass;
                        });
                      },
                      icon: SvgPicture.asset(
                        _hidePass ? "assets/icons/eye_close.svg" : "assets/icons/eye_red.svg",
                        height: 16,
                      ))),
            ),
            inputErrorTextWidget(
                state is LoginInputError && state.isPasswordError,
                "text error",
                36.0),
            Container(
              width: double.infinity,
              height: 48,
              margin: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffbEA2D43)
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: state is LoginValidated
                    ? () {
                        _onLoginButtonPress();
                      }
                    : null,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextButton(
                    onPressed: null,
                    child: Text('Forgot password?',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                TextButton(
                    onPressed: null,
                    child: Text('Sign up',
                        style: TextStyle(color: Color(0xffbEA2D43), fontWeight: FontWeight.bold)))
              ],
            )
          ],
        ),
      ));
    }));
  }

  Widget inputErrorTextWidget(isError, text, marginBottom) {
    return Container(
        margin: EdgeInsets.only(bottom: marginBottom),
        height: 20,
        child: Row(
          children: <Widget>[
            isError
                ? SvgPicture.asset(
                    "assets/icons/error.svg",
                    height: 20,
                    width: 20,
                  )
                : Container(),
            Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(isError ? text : "",
                    style: TextStyle(fontSize: 16.0, color: Colors.red[700])))
          ],
        ));
  }
}
