import 'package:bitronics_test/src/network/entities/wallet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_response.g.dart';

@JsonSerializable()
class WalletResponse{
  final bool status;
  final String? errorMessage;
  final List<Wallet> response;

  WalletResponse(this.status, this.errorMessage, this.response);

  factory WalletResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WalletResponseToJson(this);
}