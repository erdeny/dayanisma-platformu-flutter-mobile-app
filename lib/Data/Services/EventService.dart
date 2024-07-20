import 'package:pesiad_pdplatformu_mobil/Data/Providers/EventApi.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/UserService.dart';

import '../Models/EventModel.dart';

class EventService {
  static final EventService _eventService = EventService._internal();

  factory EventService(){
    return _eventService;
  }

  EventService._internal();

  final _api = EventApi();

  List<EventModel>? Events = [];
  bool isLoading = false;

  Future<void> refreshEvents() async {
    Events = [];
    await getEvents();
  }

  Future<void> getEvents() async {

    if (isLoading || Events!.isNotEmpty) {
      return;
    }

    isLoading = true;

    Events = await _api.getEvents(UserService().CurrentUser.email.toString(), UserService().CurrentUser.password.toString());

    isLoading = false;
  }

  Future<String?> joinOrLeaveEvent(EventModel eventModel) async {


    return await _api.joinOrLeaveEvent(UserService().CurrentUser.email.toString(), UserService().CurrentUser.password.toString(), eventModel.id!);

  }

}