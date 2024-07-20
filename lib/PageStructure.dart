import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/UserService.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/Events/EventScreen.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/Petitions/PetitionScreen.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/SettingsScreen.dart';

import 'Screens/HomeScreen.dart';

class PageStructure extends StatefulWidget {
  @override
  _PageStructureState createState() => _PageStructureState();
}
int _selectedIndex = 0;
late PageController _pageController;
class _PageStructureState extends State<PageStructure> {

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Colors.green.shade900,
        color: Colors.white,
        activeColor: Colors.black,
        tabBackgroundColor: Colors.white,
        gap: screenWidth * 0.020,
        padding: EdgeInsets.all(screenWidth * 0.02),
        tabs: [
          GButton(
            margin: EdgeInsets.all(screenWidth * 0.02),
            icon: Iconsax.home,
            text: "Anasayfa",
          ),
          GButton(
            margin: EdgeInsets.all(screenWidth * 0.02),
            icon: Iconsax.message_24,
            text: "Talepler",
          ),
          GButton(
            margin: EdgeInsets.all(screenWidth * 0.02),
            icon: Iconsax.activity,
            text: "Etkinlikler",
          ),
          GButton(
            margin: EdgeInsets.all(screenWidth * 0.02),
            icon: Iconsax.settings,
            text: "Ayarlar",
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          _pageController.jumpToPage(index);
        },
      ),
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomeScreen(pageController: _pageController,),
          PetitionsScreen(),
          EventsScreen(),
          SettingsScreen()
        ],
      ),
    );
  }
}



