import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/EventModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/EventService.dart';
import 'package:pesiad_pdplatformu_mobil/Widgets/EventWidget.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {

  final ScrollController _scrollController = ScrollController();
  EventService eventService = EventService();

  @override
  void initState() {
    super.initState();
    setState(() {
      eventService.getEvents().then((value) => setState(() {
        
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
           eventService.refreshEvents().then((value) => setState(() {
          }));
        });
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * .075),
                child: Row(
                  children: [
                    Text(
                      "Etkinlikler",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        alignment: Alignment.center,

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                          child: Text(
                            "Yeni",
                            style:  TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                          child: Text(
                            "Yaklaşan",
                            style:  TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth *.075),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: 'Etkinliklerde ara',
                    hintStyle:  TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(50, 120, 50, 1), width: 3),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Iconsax.search_normal),
                  ),
                  style:  TextStyle(color: Colors.black),
                  cursorColor: Color.fromRGBO(50, 120, 50, 1),
                ),
              ),
              SizedBox(
                height: screenHeight / 40,
              ),
              eventService.Events != null ? eventService.isLoading ?
              const Center(child: CircularProgressIndicator()) :
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth*.075),
                  child:  ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 12,
                      );
                    },
                    controller: _scrollController,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:  eventService.Events!.length,
                    itemBuilder: (BuildContext context, int index) {

                      EventModel event = eventService.Events![index];
                      return EventWidget(event: event);
                    },
                  ),
              ) :
              Center(
                child: Text("Bir hata oluştu!", style: TextStyle(color: Colors.red),),
              ),
              SizedBox(
                height: screenHeight / 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

