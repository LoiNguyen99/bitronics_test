
import 'package:bitronics_test/src/network/entities/user.dart';
import 'package:bitronics_test/src/network/clients/api_client.dart';
import 'package:bitronics_test/src/network/responses/user_response.dart';
import 'package:dio/dio.dart' as dio;

class AuthProvider{

  ApiClient apiClient = ApiClient(dio.Dio());

  final String token = "Basic VVNFUl9FVEVSTkFMX1VTRVJfQVBQOlVTRVJfRVRFUk5BTF9VU0VSX0FQUEAyMDIx";

  Future<UserResponse> login(String username, String password) async {
    final Map<String, dynamic> formData = {
      "username": username,
      "password": password
    };

    UserResponse userResponse;

    try {
      var response = await apiClient.login(token, formData);
      userResponse = UserResponse(true, response);
    }catch(error){
      userResponse = UserResponse(true, null);
    }
    return userResponse;
  }
}