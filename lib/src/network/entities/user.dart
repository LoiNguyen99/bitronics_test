import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'user.g.dart';

@JsonSerializable()
class User{

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'token_type')
  final String tokenType;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  final String scope;
  final String hashId;
  final String email;
  final String userType;
  final String countryId;
  final String kyc;
  final String dialCode;
  final String phoneNumber;
  final bool google2Fa;
  final String jti;

  User(
      this.accessToken,
      this.tokenType,
      this.refreshToken,
      this.scope,
      this.hashId,
      this.email,
      this.userType,
      this.countryId,
      this.kyc,
      this.dialCode,
      this.phoneNumber,
      this.google2Fa,
      this.jti);

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}