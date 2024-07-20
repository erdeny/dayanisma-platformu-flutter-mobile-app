import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';

class RecylerBinMap extends StatelessWidget {
  const RecylerBinMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(40.9, 29.25),
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
      
                    width: 53,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.9, 29.25),
                    child: Container(
      
                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%75",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),
      
                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.888, 29.2589),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%25",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.92011655242392, 29.264190959474433),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%50",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.89832079083098, 29.268823753089524),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%25",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.8784011256123, 29.241402823491626),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%75",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.88021626991478, 29.266849292890356),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%0",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.8952719679111, 29.237881963390482),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%75",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.878757020626495, 29.26217149387515),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%75",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.89037316715561, 29.24522157720747),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%25",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.89549873968028, 29.256680945919744),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%50",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.87525420820061, 29.247925134670066),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%25",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.88485739124616, 29.238613005521923),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%50",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.88511437039415, 29.272429635627102),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%25",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.90707878448687, 29.251788034504383),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%75",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.91492770903974, 29.256080471747516),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%25",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.86963922035598, 29.263888215942696),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%75",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.89218909660042, 29.269855887452245),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%25",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.90484141987584, 29.267194684903682),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%75",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.911262393933846, 29.26912396442882),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%25",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.88589600841165, 29.247839691591736),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%75",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Marker(

                    width: 57,
                    height: 24,
                    alignment: Alignment(Alignment.centerRight.x - .1, Alignment.centerRight.y),
                    point: LatLng(40.875414559150634, 29.272772217323432),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5,vertical: 2.0),
                        child:Row(
                          children: [
                            Icon(Icons.recycling_rounded, color: Colors.white, size: 14),
                            SizedBox(width: 4,),
                            Text(
                              "%25",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
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
                      'Geri Dönüşüm Kutuları',
                      prependCopyright: false,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                    ),
                     TextSourceAttribution(
                      'Geri dönüşüm kutularının konumları ve doluluk oranları haritada gösterilmektedir',
                      prependCopyright: false,
                    ),
                  ],
                ),
              ]),
          SafeArea(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 4)
                  ]
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded, color: Colors.green[900],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
