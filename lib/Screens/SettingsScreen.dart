import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/Donations/MyDonationsScreen.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/ProfileScreen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

bool switchValue = false;

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40,left: 20),
                child: Text(
                  "Ayarlar",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Iconsax.user,color: Colors.green[900],),
                    ),
                    Text(
                      "Hesabım",
                      style:  const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Iconsax.arrow_right_3),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Iconsax.notification,color: Colors.green[900],),
                    ),
                    Text(
                      "Bildirimler",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Switch(
                        activeColor: Colors.green[900],
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                      ),
                    )

                  ],
                ),
              ),
              InkWell(
                onTap: () {

                },
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Iconsax.message_question,color: Colors.green[900],),
                    ),
                    Text(
                      "Uygulama Hakkında",
                      style:  const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Iconsax.arrow_right_3),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDonationsScreen()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Iconsax.heart_circle,color: Colors.green[900],),
                    ),
                    Text(
                      "Bağışlarım",
                      style:  const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Iconsax.arrow_right_3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
