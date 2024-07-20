import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pesiad_pdplatformu_mobil/Data/Models/DetailedPetitionModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/DonationModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/LightPetitionModel.dart';
import 'package:pesiad_pdplatformu_mobil/constants.dart';
import 'package:http_parser/http_parser.dart';

import '../Services/ApiService.dart';

class DonationApi {
  Future<List<DonationModel>?> getDonations(String email, String password) async {

    try {
      final response = await APIService.instance.request(
          '/api/donations/donated',
          DioMethod.get,
          email: email,
          password: password
      );
      if (response.statusCode == 200) {
        List<DonationModel> list = [];
        List<dynamic> response_list = response.data;
        response_list.forEach((value) {
          list.add(DonationModel.fromJson(value));

        });
        return list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> donate(String email, String password, List<File> images, String name, String address, String phone_number, String product_name, String description) async {

    var formData = FormData.fromMap({
      'product_name':product_name,
      'description':description,
      'name':name,
      'phone_number':phone_number,
      'address':address
    });
    for (var file in images) {
      formData.files.add(
        MapEntry("images", await MultipartFile.fromFile(file.path, filename: file.path.split('/').last)),
      );
    }

    try {
      final response =  await APIService.instance.request(
          '/api/donations/donated',
          DioMethod.post,
          email: email,
          password: password,
          formData: formData,
      );
      if (response.statusCode == 200) {
        return;
      }
    } catch (e)  {
      print((e as DioException).response?.data);
      print(e);
      return;
    }
  }

  Future<void> askForDonation(String email, String password, String name, String address, String phone_number, String description) async {

    try {
      final response =  await APIService.instance.request(
        '/api/donations/asked',
        DioMethod.post,
        email: email,
        password: password,
        formData: FormData.fromMap({

          'description':description,
          'name':name,
          'phone_number':phone_number,
          'address':address
        }),
      );
      if (response.statusCode == 200) {
        return;
      }
    } catch (e)  {
      print(e);
      return;
    }
  }

}