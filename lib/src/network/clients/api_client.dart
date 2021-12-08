import 'dart:convert';
import 'dart:io';
import 'package:bitronics_test/src/network/entities/user.dart';
import 'package:bitronics_test/src/network/entities/wallet.dart';
import 'package:bitronics_test/src/network/responses/wallet_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://v2-api.ibitz.io/")
abstract class ApiClient{
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("user/oauth/token?grant_type=password")
  @Headers(<String, dynamic>{ //Static header
    "Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
  })
  Future<User> login(@Header("Authorization") String token, @Body() Map<String, dynamic> formData);

  @GET("wallet/all")
  Future<WalletResponse> getAllWallet(@Header("Authorization") String token);

}