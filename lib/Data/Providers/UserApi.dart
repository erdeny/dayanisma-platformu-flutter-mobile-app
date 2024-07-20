import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pesiad_pdplatformu_mobil/Data/Models/UserModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/ApiService.dart';
import 'package:pesiad_pdplatformu_mobil/constants.dart';

class UserApi {


  Future<UserModel?> getUserInformation(String email, String password) async {

    try{
      final response = await APIService.instance.request(
          '/api/user',
          DioMethod.get,
          email: email,
          password: password
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }

  }

  Future<String> addUser(String email, String password, String username, String phone_number, String name, String surname) async {

    try {
      final response =  await APIService.instance.request(
          '/api/user',
          DioMethod.post,
          formData: FormData.fromMap({
            "username":username,
            "email":email,
            "password":password,
            "phone_number":phone_number,
            "name":name,
            "surname":surname
          })
      );
      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        return "Bir hata oluştu";
      }
    } on DioException catch(e) {
      return e.response?.data['message'] ?? 'Bilinmeyen bir hata oluştu';
    }
    catch (e) {
      return "Bilinmeyen bir hata oluştu!";
    }
  }

}