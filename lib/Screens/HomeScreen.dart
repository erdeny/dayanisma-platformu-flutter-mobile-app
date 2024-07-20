import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/EventService.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/UserService.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/Auth/LoginScreen.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/Donations/DonateScreen.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/Donations/RequestDonationScreen.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/RecyclerBinMap.dart';

import '../Data/Models/EventModel.dart';
import '../Widgets/EventWidget.dart';
import 'ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  PageController pageController;

  HomeScreen({required this.pageController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _carouselPage = 1;
  UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    setState(() {
      EventService().getEvents().then((value) => setState(() {
        
      }));
    });
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.075, vertical: screenHeight*.02),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "DAYANIŞMA PLATFORMU",
                        style:  TextStyle(
                            color: Colors.green[900],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                      child: userService.CurrentUser.profilePhoto != null ? Image.network(
                        userService.CurrentUser.profilePhoto.toString(),
                        errorBuilder: (context, error, stackTrace) {
                          return CircleAvatar(
                            backgroundColor: Colors.green[50],
                            foregroundImage: AssetImage(
                                "assets/images/default.png"
                            ),
                          );
                        },
                        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                          return CircleAvatar(
                            backgroundColor: Colors.green[50],
                            foregroundImage: NetworkImage(
                                userService.CurrentUser.profilePhoto.toString()
                            ),
                          );
                        },
                      ) : CircleAvatar(
                        backgroundColor: Colors.green[50],
                        foregroundImage: AssetImage(
                            "assets/images/default.png"
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.075),
              child: Container(

                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: 'Uygulamada ara',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(50, 120, 50, 1),
                        width: 3,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Iconsax.search_normal),
                  ),
                  style: TextStyle(color: Colors.black),
                  cursorColor: Color.fromRGBO(50, 120, 50, 1),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: CarouselSlider(
                    options: CarouselOptions(autoPlay: true,
                      autoPlayInterval: Duration(milliseconds: 4500),
                      viewportFraction: .93,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _carouselPage = index;
                        });
                      },
                    ),
                    items: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RequestDonationScreen()),
                          );
                        },
                        child: Container(
                          child: ClipRRect(
                            child: Image.asset("assets/images/ihtiyacard1.png"),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonateScreen()),
                          );
                        },
                        child: Container(
                          child: ClipRRect(
                            child: Image.asset("assets/images/ihtiyacard3.png"),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecylerBinMap()),
                          );
                        },
                        child: Container(
                          child: ClipRRect(
                            child: Image.asset("assets/images/geridonoktalari.png"),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenWidth * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIndicator(0),
                    _buildIndicator(1),
                    _buildIndicator(2),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.075),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Etkinlikler",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                  ),

                  InkWell(
                    onTap: () {
                      widget.pageController.jumpToPage(2);
                    },
                    child: Text(
                      "Tümü",
                      style:  TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            EventService().isLoading ?
            Container(height: 250, child: Center(
              child: CircularProgressIndicator(),
            ),)   :
            EventService().Events != null && EventService().Events!.isNotEmpty  ?
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.075),
              child: EventWidget(
                event: EventService().Events!.first,
              ),
            ) : Center(
              child: Text("Henüz bir etkinlik yok"),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 20,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: _carouselPage == index ? Colors.green[900] : Colors.black54,
      ),
    );
  }
}