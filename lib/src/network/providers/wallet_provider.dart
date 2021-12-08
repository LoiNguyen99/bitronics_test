
import 'package:bitronics_test/src/network/clients/api_client.dart';
import 'package:bitronics_test/src/network/entities/wallet.dart';
import 'package:bitronics_test/src/network/responses/wallet_response.dart';
import 'package:bitronics_test/src/repositories/token_repository.dart';
import 'package:dio/dio.dart' as dio;

class WalletProvider{

  ApiClient apiClient = ApiClient(dio.Dio());

  TokenRepository tokenRepository = TokenRepository();

  Future<WalletResponse> getAllWallet() async {
    WalletResponse response;
    try {
      response = await apiClient.getAllWallet(await getToken());
    }catch(error){
      response = WalletResponse(false, "Error", []);
    }
    return response;
  }

  Future<String> getToken() async {
    String? accessToken = await tokenRepository.getAccessToken();
    String? tokenType = await tokenRepository.getTokenType();
    if(tokenType!.contains("bearer")){
      tokenType = "Bearer";
    }
    String token = tokenType.trim() + " " + accessToken!.trim();
    return token;
  }
}