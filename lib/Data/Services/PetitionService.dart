import 'dart:io';

import 'package:pesiad_pdplatformu_mobil/Data/Models/DetailedPetitionModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/LightPetitionModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Providers/PetitionApi.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/UserService.dart';

import '../Models/EventModel.dart';

class PetitionService {
  static final PetitionService _petitionService = PetitionService._internal();

  factory PetitionService(){
    return _petitionService;
  }

  PetitionService._internal();

  final _api = PetitionApi();

  List<LightPetitionModel>? Petitions = [];
  bool isLoading = false;

  Future<void> refreshPetitions() async {
    Petitions = [];
    await getPetitions();
  }

  Future<void> getPetitions() async {

    if (isLoading || Petitions!.isNotEmpty) {
      return;
    }

    isLoading = true;

    Petitions = await _api.getPetitions(UserService().CurrentUser.email.toString(), UserService().CurrentUser.password.toString());

    isLoading = false;
  }

  Future<DetailedPetitionModel?> getPetition(int petition_id) async {
    return await _api.getPetition(UserService().CurrentUser.email.toString(), UserService().CurrentUser.password.toString(), petition_id);
  }

  Future<String?> makePetition(List<File> images, String content) async {
    return await _api.sendPetition(UserService().CurrentUser.email.toString(), UserService().CurrentUser.password.toString(), images, content);
  }

  Future<void> sendComment(int petition_id, String content) async {
    return await _api.sendComment(UserService().CurrentUser.email.toString(), UserService().CurrentUser.password.toString(),petition_id,content);
  }

  Future<void> likePetition(int petition_id) async {
    return await _api.likePetition(UserService().CurrentUser.email.toString(), UserService().CurrentUser.password.toString(),petition_id);
  }

  Future<void> dislikePetition(int petition_id) async {
    return await _api.dislikePetition(UserService().CurrentUser.email.toString(), UserService().CurrentUser.password.toString(),petition_id);
  }

}