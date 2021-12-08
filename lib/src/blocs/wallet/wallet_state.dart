import 'package:bitronics_test/src/network/entities/wallet.dart';
import 'package:equatable/equatable.dart';

abstract class WalletState extends Equatable{
  final List<Wallet>? wallets;
  const WalletState({required this.wallets});

  @override
  List<Object> get props => [wallets!];
}

class WalletInitial extends WalletState{
  const WalletInitial(List<Wallet>? wallets) : super(wallets: wallets);
}

class WalletLoading extends WalletState{
  const WalletLoading(List<Wallet>? wallets) : super(wallets: wallets);
}

class WalletLoadSuccess extends WalletState{
  const WalletLoadSuccess(List<Wallet>? wallets) : super(wallets: wallets);
}