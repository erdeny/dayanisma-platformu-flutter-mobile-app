import 'dart:io';

import 'package:pesiad_pdplatformu_mobil/Data/Models/UserModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Providers/UserApi.dart';

class UserService {
  static final UserService _userService = UserService._internal();

  factory UserService(){
    return _userService;
  }

  UserService._internal();

  late UserModel CurrentUser;

  final _api = UserApi();

  Future<bool> Login(String email, String password) async{
    UserModel? userInfo = await _api.getUserInformation(email, password);
    if (userInfo != null) {
      userInfo.password = password;
      CurrentUser = userInfo;
      return true;
    }
    return false;
  }

  Future<String> SignUp(String email, String password, String username, String phone_number, String name, String surname) async{
    return _api.addUser(email, password, username, phone_number, name, surname);
  }

}