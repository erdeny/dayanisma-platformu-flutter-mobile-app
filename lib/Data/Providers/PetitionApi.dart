import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pesiad_pdplatformu_mobil/Data/Models/DetailedPetitionModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/LightPetitionModel.dart';
import 'package:pesiad_pdplatformu_mobil/constants.dart';
import 'package:http_parser/http_parser.dart';

import '../Services/ApiService.dart';

class PetitionApi {
  Future<List<LightPetitionModel>?> getPetitions(String email, String password) async {

    try {
      final response = await APIService.instance.request(
          '/api/petitions',
          DioMethod.get,
          email: email,
          password: password
      );
      if (response.statusCode == 200) {
        List<LightPetitionModel> list = [];
        List<dynamic> response_list = response.data;
        print(response_list);
        response_list.forEach((value) {
          list.add(LightPetitionModel.fromJson(value));

        });
        return list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }

  }

  Future<DetailedPetitionModel?> getPetition(String email, String password, int petition_id) async {

    try {
      final response = await APIService.instance.request(
          '/api/petitions/$petition_id',
          DioMethod.get,
          email: email,
          password: password
      );
      if (response.statusCode == 200) {
        return DetailedPetitionModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }

  }

  Future<String?> sendPetition(String email, String password, List<File> images, String content) async {

    var formData = FormData.fromMap({
      'petition':content
    });
    for (var file in images) {
      formData.files.add(
        MapEntry("images", await MultipartFile.fromFile(file.path, filename: file.path.split('/').last)),
      );
    }

    try {
      final response =  await APIService.instance.request(
          '/api/petitions',
          DioMethod.post,
          email: email,
          password: password,
          formData: formData,
      );
      if (response.statusCode == 200) {
        return "Başarılı, Talebiniz gönderildi!";
      }
    } catch (e)  {
      try{
        return "Başarısız!\n${(e as DioException).response?.data['message']}";

      } catch (e) {
        return "Başarısız!";
      }
    }
  }

  Future<void> sendComment(String email, String password, int petition_id , String content) async {

    try {
      final response =  await APIService.instance.request(
          '/api/petitions/$petition_id',
          DioMethod.post,
          email: email,
          password: password,
          formData: FormData.fromMap({
            "content":content,
          })
      );
    } catch (e) {
      return;
    }

  }

  Future<void> likePetition(String email, String password, int petition_id) async {
    try {
      final response =  await APIService.instance.request(
          '/api/petitions/$petition_id',
          DioMethod.put,
          email: email,
          password: password,
      );
    } catch (e) {
      return;
    }
  }

  Future<void> dislikePetition(String email, String password, int petition_id) async {
    try {
      final response =  await APIService.instance.request(
        '/api/petitions/$petition_id',
        DioMethod.delete,
        email: email,
        password: password,
      );
    } catch (e) {
      return;
    }
  }

}