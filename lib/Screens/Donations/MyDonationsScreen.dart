import 'package:flutter/material.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/DonationModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/DonationService.dart';
import 'package:pesiad_pdplatformu_mobil/Widgets/DonationWidget.dart';

class MyDonationsScreen extends StatefulWidget {
  @override
  _MyDonationsScreenState createState() => _MyDonationsScreenState();
}

class _MyDonationsScreenState extends State<MyDonationsScreen> {

  final ScrollController _scrollController = ScrollController();
  DonationService donationService = new DonationService();

  @override
  void initState() {
    super.initState();
    setState(() {
      donationService.getDonations().then((value) => setState(() {

      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            donationService.refreshDonations().then((value) => setState(() {
            }));
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green[900],),
                          Text("Ayarlar",style: TextStyle(color: Colors.green[900]),),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bağışlarım",
                          style:  TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  donationService.Donations != null ? donationService.isLoading ?
                  const Center(child: CircularProgressIndicator()) :
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 12,
                      );
                    },
                    controller: _scrollController,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:  donationService.Donations!.length,
                    itemBuilder: (BuildContext context, int index) {

                      DonationModel donation = donationService.Donations![index];
                      return DonationWidget(donationModel: donation);
                    },
                  ) :
                  Center(
                    child: Text("Bir hata oluştu!", style: TextStyle(color: Colors.red),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}