
import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable()
class Wallet {
  final String currencyName;
  final String currencySymbol;
  final String currencyType;
  final String iconUrl;
  final String totalBalance;
  final String? address;
  final String? qrCode;
  final String availableBalance;
  final String inOrderBalance;
  final String lockedBalance;
  final String maxLimitFor24Hrs;
  final double trxFeeMultiplier;
  final double trxMinimumAmount;
  final double decimalPoints;


  Wallet(
      this.currencyName,
      this.currencySymbol,
      this.currencyType,
      this.iconUrl,
      this.totalBalance,
      this.address,
      this.qrCode,
      this.availableBalance,
      this.inOrderBalance,
      this.lockedBalance,
      this.maxLimitFor24Hrs,
      this.trxFeeMultiplier,
      this.trxMinimumAmount,
      this.decimalPoints);

  factory Wallet.fromJson(Map<String, dynamic> json) =>
      _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);


}