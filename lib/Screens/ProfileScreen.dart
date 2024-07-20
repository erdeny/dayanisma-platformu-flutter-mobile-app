import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/EventService.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/PetitionService.dart';

import '../Data/Services/UserService.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 40,left: 20),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green[900],),
                    Text("Geri",style: TextStyle(color: Colors.green[900]),),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: 120,
                height: 120,
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
                  backgroundColor: Colors.green[100],
                  foregroundImage: AssetImage(
                      "assets/images/default.png"
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              "${userService.CurrentUser.name} ${userService.CurrentUser.surname}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:  const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
              ),
            ),
            Text(
              userService.CurrentUser.email.toString(),
              style:  const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
            ),
            const SizedBox(height: 15,),
            InkWell(
              onTap: (){

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
                    child: Icon(Iconsax.edit,color: Colors.green[900],),
                  ),
                  Text(
                    "Ad soyad",
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
                    child: Icon(Iconsax.message_24,color: Colors.green[900],),
                  ),
                  Text(
                    "E-Posta adresi",
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
                    child: Icon(Iconsax.call,color: Colors.green[900],),
                  ),
                  Text(
                    "Telefon Numarası",
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
                    child: Icon(Iconsax.lock,color: Colors.green[900],),
                  ),
                  Text(
                    "Şifreni değiştir",
                    style: const TextStyle(
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
                    child: Icon(Iconsax.profile_delete,color: Colors.green[900],),
                  ),
                  Text(
                    "Hesabımı sil",
                    style: const TextStyle(
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
                EventService().Events = [];
                PetitionService().Petitions = [];

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
                    child: Icon(Iconsax.logout,color: Colors.green[900],),
                  ),
                  Text(
                    "Çıkış yap",
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
    );
  }
}
