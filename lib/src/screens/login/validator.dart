import 'dart:async';

class Validators {
  static bool isValidUsername(String username){
    if(username.length > 5){
      return true;
    }
    return false;
  }

  static bool isValidPassword(String password){
    if(password.length > 5){
      return true;
    }
    return false;
  }

}