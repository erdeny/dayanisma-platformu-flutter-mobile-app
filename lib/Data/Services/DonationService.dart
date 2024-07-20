import 'dart:ffi';
import 'dart:io';

import 'package:pesiad_pdplatformu_mobil/Data/Models/DetailedPetitionModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/DonationModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/LightPetitionModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Providers/DonationApi.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Providers/PetitionApi.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/UserService.dart';

import '../Models/EventModel.dart';

class DonationService {
  static final DonationService _petitionService = DonationService._internal();

  factory DonationService(){
    return _petitionService;
  }

  DonationService._internal();

  final _api = DonationApi();

  List<DonationModel>? Donations = [];
  bool isLoading = false;

  Future<void> refreshDonations() async {
    Donations = [];
    await getDonations();
  }

  Future<void> getDonations() async {

    if (isLoading || Donations!.isNotEmpty) {
      return;
    }

    isLoading = true;

    Donations = await _api.getDonations(UserService().CurrentUser.email.toString(), UserService().CurrentUser.password.toString());

    isLoading = false;
  }

  Future<void> makeDonation(List<File> images, String name, String address, String phone_number, String product_name, String description) async {
    await _api.donate(UserService().CurrentUser.email.toString(), UserService().CurrentUser.password.toString(), images, name, address, phone_number, product_name, description );
  }

  Future<void> askDonation(String name, String address, String phone_number, String description) async {
    await _api.askForDonation(UserService().CurrentUser.email.toString(), UserService().CurrentUser.password.toString(), name, address, phone_number, description );
  }
}