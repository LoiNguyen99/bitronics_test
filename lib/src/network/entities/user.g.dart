// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['access_token'] as String,
      json['token_type'] as String,
      json['refresh_token'] as String,
      json['scope'] as String,
      json['hashId'] as String,
      json['email'] as String,
      json['userType'] as String,
      json['countryId'] as String,
      json['kyc'] as String,
      json['dialCode'] as String,
      json['phoneNumber'] as String,
      json['google2Fa'] as bool,
      json['jti'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'scope': instance.scope,
      'hashId': instance.hashId,
      'email': instance.email,
      'userType': instance.userType,
      'countryId': instance.countryId,
      'kyc': instance.kyc,
      'dialCode': instance.dialCode,
      'phoneNumber': instance.phoneNumber,
      'google2Fa': instance.google2Fa,
      'jti': instance.jti,
    };
