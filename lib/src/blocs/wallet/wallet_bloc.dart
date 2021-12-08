import 'dart:async';

import 'package:bitronics_test/src/blocs/auth/auth_bloc.dart';
import 'package:bitronics_test/src/blocs/auth/auth_event.dart';
import 'package:bitronics_test/src/blocs/login/login_event.dart';
import 'package:bitronics_test/src/blocs/login/login_state.dart';
import 'package:bitronics_test/src/blocs/wallet/wallet_event.dart';
import 'package:bitronics_test/src/blocs/wallet/wallet_state.dart';
import 'package:bitronics_test/src/network/entities/wallet.dart';
import 'package:bitronics_test/src/network/providers/auth_provider.dart';
import 'package:bitronics_test/src/network/providers/wallet_provider.dart';
import 'package:bitronics_test/src/network/responses/wallet_response.dart';
import 'package:bitronics_test/src/screens/login/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState>{
  bool isUsernameError = false;
  bool isPasswordError = false;

  WalletProvider walletProvider = WalletProvider();

  WalletBloc() : super(const WalletInitial(null)){
    on<WalletLoadData>(_onWalletLoadData);
  }

  _onWalletLoadData(WalletLoadData event, Emitter<WalletState> emit) async {
    emit(const WalletLoading(null));
    WalletResponse walletResponse = await walletProvider.getAllWallet();
    if(walletResponse.status == true){
      List<Wallet> wallets = walletResponse.response;
      emit(WalletLoadSuccess(wallets));
    }else{
      emit(const WalletInitial(null));
    }
  }

}