import 'package:bitronics_test/src/blocs/auth/auth_bloc.dart';
import 'package:bitronics_test/src/blocs/auth/auth_event.dart';
import 'package:bitronics_test/src/blocs/wallet/wallet_bloc.dart';
import 'package:bitronics_test/src/network/providers/wallet_provider.dart';
import 'package:bitronics_test/src/screens/balance/wallet_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);
  final String title = "Balance";

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffb2F2F30),
          centerTitle: true,
          title: SvgPicture.asset("assets/icons/Eternalwallet_logo.svg",
              width: 36, height: 36),
          actions: [
            PopupMenuButton(
                icon: SvgPicture.asset("assets/icons/header_menu.svg"),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("Sign out"),
                        value: 1,
                        onTap: (){
                          BlocProvider.of<AuthBloc>(context).add(LogOut());
                        },
                      )
                    ])
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ),
        body: BlocProvider(
          create: (context) {
            return WalletBloc();
          },
          child: const WalletScreen(),
        ));
  }
}
