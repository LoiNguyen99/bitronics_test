import 'package:bitronics_test/src/network/entities/user.dart';

class UserResponse{
  final bool status;
  final User? user;

  UserResponse(this.status, this.user);
}