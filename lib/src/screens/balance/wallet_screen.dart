import 'package:bitronics_test/src/blocs/wallet/wallet_bloc.dart';
import 'package:bitronics_test/src/blocs/wallet/wallet_event.dart';
import 'package:bitronics_test/src/blocs/wallet/wallet_state.dart';
import 'package:bitronics_test/src/network/entities/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);
  final String title = "Balance";

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<WalletBloc>(context).add(WalletLoadData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletBloc, WalletState>(
      listener: (context, state) {},
      child: BlocBuilder<WalletBloc, WalletState>(builder: (context, state) {
        return state is WalletLoadSuccess && state.wallets!.isNotEmpty
            ? Column(
          children: [
            //search
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset("assets/icons/Search.svg",
                          height: 20)),
                  const Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "search",
                          hintStyle: TextStyle(fontSize: 18)),
                    ),
                  ),
                  IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(
                        "assets/icons/list_gray.svg",
                        height: 20,
                      )),
                  IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(
                        "assets/icons/grid_black.svg",
                        height: 20,
                      )),
                ],
              ),
            ),
            //Card
            Container(
              child: Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.wallets!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return walletCard(state.wallets![index]);
                  },
                ),
              ),
            )
          ],
        )
            : state is WalletLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Container();
      }),
    );
  }

  Widget walletCard(Wallet wallet) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {},
          child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.network(wallet.iconUrl, height: 25),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  wallet.currencySymbol,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      fontSize: 18),
                                ),
                                SvgPicture.asset("assets/icons/pull_down.svg")
                              ],
                            ),
                          ),
                          walletInfoLine("Available",
                              numberformat(wallet.availableBalance), wallet.currencySymbol),
                          walletInfoLine(
                              "In order", numberformat(wallet.inOrderBalance), ""),
                          walletInfoLine("Available",
                              numberformat(wallet.availableBalance), ""),
                          walletInfoLine("Lock", wallet.lockedBalance, "")
                        ],
                      )),
                ],
              )),
        ),
      ),
    );
  }

  Widget ConcurrencyText(String number, String symbol) {
    var list = number.split(".");
    return RichText(
      text: TextSpan(
        text: list[0],
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        children: <TextSpan>[
          TextSpan(text: "." + list[1].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black45)),
          TextSpan(text: symbol != "" ? " " + symbol : "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget walletInfoLine(String name, String value, String symbol) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black45,
                fontWeight: FontWeight.bold),
          ),
          ConcurrencyText(value, symbol),
        ],
      ),
    );
  }

  Widget walletInfoLineNumber(String name, double value) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black45,
                fontWeight: FontWeight.bold),
          ),
          Text(
            value.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
      ),
    );
  }

  String numberformat(String numberString) {
    final oCcy = new NumberFormat("#,##0.000", "en_US");
    var number = double.parse(numberString);
    return oCcy.format(number);
  }
}
