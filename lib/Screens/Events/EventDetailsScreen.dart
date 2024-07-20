import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/EventService.dart';

import '../../Data/Models/EventModel.dart';

class EventDetailsScreen extends StatefulWidget {

  final EventModel event;
  EventDetailsScreen({required this.event});

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
   DateFormat format= new DateFormat('dd MMMM yyyy HH:mm', 'tr_TR');
  @override
  void initState() {
    super.initState();
  }

  void resState() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green[900],),
                        Text("Geri",style: TextStyle(color: Colors.green[900]),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  height: screenHeight*.40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          widget.event.thumbnailSrc.toString()
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  widget.event.title.toString(),
                  style:  TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Iconsax.timer_1,
                        size: 18,
                      ),
                    ),
                    Text(
                      widget.event.timeLeft(),
                      style:  TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "${format.format(widget.event.startAt!)} - ${format.format(widget.event.endAt!)}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style:  TextStyle(
                    fontSize: 12,
                    color: Colors.black54,

                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Iconsax.people5,
                        size: 18,
                      ),
                    ),
                    Text(
                      "${widget.event.participantCount} katılımcı",
                      style:  TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.event.description.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Iconsax.location,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.event.address.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: screenHeight*.40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(widget.event.coordinates?.lat as double, widget.event.coordinates?.long as double),
                          initialZoom: 12,
                          cameraConstraint: CameraConstraint.contain(
                            bounds: LatLngBounds(
                              const LatLng(-90, -180),
                              const LatLng(90, 180),
                            ),
                          ),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                            // Plenty of other options available!
                          ),
                          MarkerLayer(markers: [
                            Marker(

                              width: 150,
                              alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                              point: LatLng(widget.event.coordinates?.lat as double, widget.event.coordinates?.long as double),
                              child: Container(

                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child:
                                Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8,vertical: 4.0),
                                    child:Row(
                                      children: [
                                        Icon(Iconsax.location5, color: Colors.white, size: 16),
                                        SizedBox(width: 4,),
                                        Text(
                                          "Etkinlik Konumu",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                        ),

                                      ],
                                    ),
                                ),
                              ),
                            ),
                          ]),
                          RichAttributionWidget(
                            popupInitialDisplayDuration: const Duration(seconds: 5),
                            animationConfig: const ScaleRAWA(),
                            showFlutterMapAttribution: false,
                            attributions: [
                              TextSourceAttribution(
                                'Etkinlik Konum Bilgisi',
                                prependCopyright: false,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              const TextSourceAttribution(
                                'Etkinliğin konumu harita üzerinde işaretlenmiştir',
                                prependCopyright: false,
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        EventService().joinOrLeaveEvent(widget.event).then((value) {
                          setState(() {
                            widget.event.isUserParticipant = ! widget.event.isUserParticipant!;
                            if (widget.event.isUserParticipant!) {
                              widget.event.participantCount = (widget.event.participantCount ?? 0) + 1;
                            } else {
                              widget.event.participantCount = (widget.event.participantCount ?? 1) - 1;
                            }
                          });
                          EventService().refreshEvents();
                        });

                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.event.isUserParticipant??false ? "AYRIL" : "ETKİNLİĞE KATIL",
                          style:  TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                        ),
                        width: screenWidth / 1.5,
                        height: screenHeight / 13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: widget.event.isUserParticipant??false ? Colors.grey[900] : Colors.green[900],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Icon(
                          Iconsax.share5,
                          color: Colors.white,
                          size: 35,
                        ),
                        width: screenWidth / 6,
                        height: screenHeight / 13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green[900],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}