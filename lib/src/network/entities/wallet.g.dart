// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      json['currencyName'] as String,
      json['currencySymbol'] as String,
      json['currencyType'] as String,
      json['iconUrl'] as String,
      json['totalBalance'] as String,
      json['address'] as String?,
      json['qrCode'] as String?,
      json['availableBalance'] as String,
      json['inOrderBalance'] as String,
      json['lockedBalance'] as String,
      json['maxLimitFor24Hrs'] as String,
      (json['trxFeeMultiplier'] as num).toDouble(),
      (json['trxMinimumAmount'] as num).toDouble(),
      (json['decimalPoints'] as num).toDouble(),
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'currencyName': instance.currencyName,
      'currencySymbol': instance.currencySymbol,
      'currencyType': instance.currencyType,
      'iconUrl': instance.iconUrl,
      'totalBalance': instance.totalBalance,
      'address': instance.address,
      'qrCode': instance.qrCode,
      'availableBalance': instance.availableBalance,
      'inOrderBalance': instance.inOrderBalance,
      'lockedBalance': instance.lockedBalance,
      'maxLimitFor24Hrs': instance.maxLimitFor24Hrs,
      'trxFeeMultiplier': instance.trxFeeMultiplier,
      'trxMinimumAmount': instance.trxMinimumAmount,
      'decimalPoints': instance.decimalPoints,
    };
