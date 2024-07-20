import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pesiad_pdplatformu_mobil/Data/Models/EventModel.dart';
import 'package:pesiad_pdplatformu_mobil/constants.dart';

import '../Services/ApiService.dart';

class EventApi {
  Future<List<EventModel>?> getEvents(String email, String password) async {
    try {
      final response =  await APIService.instance.request(
          '/api/events',
          DioMethod.get,
          email: email,
          password: password
      );
      if (response.statusCode == 200) {
        List<EventModel> list = [];
        List<dynamic> response_list = response.data;
        response_list.forEach((value) {
          list.add(EventModel.fromJson(value));

        });
        return list;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }

  }

  Future<String?> joinOrLeaveEvent(String email, String password,
      int event_id) async {
    try {
      final response =  await APIService.instance.request(
          '/api/events/$event_id',
          DioMethod.put,
          email: email,
          password: password
      );
      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}