import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/LightPetitionModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/PetitionService.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/Petitions/SendPetitionScreen.dart';

import '../../Widgets/PetitionWidget.dart';

class PetitionsScreen extends StatefulWidget {
  @override
  _PetitionsScreenState createState() => _PetitionsScreenState();
}

class _PetitionsScreenState extends State<PetitionsScreen> {
  final ScrollController _scrollController = ScrollController();
  PetitionService petitionService = PetitionService();

  @override
  void initState() {
    super.initState();
    setState(() {
      petitionService.getPetitions().then((value) => setState(() {

      }));
    });
  }

  void resState() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SendPetitionScreen()),
            );
          },
          backgroundColor: Colors.green[900],
          child: Icon(Iconsax.message_add_15,color: Colors.white,),
        ),
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              petitionService.refreshPetitions().then((value) => setState(() {
              }));
            });
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      "Talepler",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                  ),
                  petitionService.Petitions != null ? petitionService.isLoading ?
                  const Center(child: CircularProgressIndicator()) :
                      petitionService.Petitions!.isEmpty ?
                          Center(child: Text("Henüz bir talep yok."),):
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 12,
                      );
                    },
                    controller: _scrollController,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:  petitionService.Petitions!.length,
                    itemBuilder: (BuildContext context, int index) {

                      LightPetitionModel petition = petitionService.Petitions![index];
                      return PetitionWidget(resState: resState,petitionModel: petition);
                    },
                  ) :
                  Center(
                    child: Text("Bir hata oluştu!", style: TextStyle(color: Colors.red),),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
        ));
  }
}

