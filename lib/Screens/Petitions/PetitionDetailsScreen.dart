import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/UserService.dart';
import 'package:pesiad_pdplatformu_mobil/Widgets/PetitionCommentWidget.dart';
import 'package:pesiad_pdplatformu_mobil/Widgets/PetitionWidget.dart';

import '../../Data/Models/DetailedPetitionModel.dart';
import '../../Data/Services/PetitionService.dart';
import '../../Utils.dart';

class PetitionDetailsScreen extends StatefulWidget {
  int petition_id;
  Function resState;
  PetitionDetailsScreen({required this.petition_id, required this.resState});

  @override
  _PetitionDetailsScreenState createState() => _PetitionDetailsScreenState();
}

class _PetitionDetailsScreenState extends State<PetitionDetailsScreen> {

  late DetailedPetitionModel? petitionModel;
  bool isLoading = true;
  TextEditingController textEditingController = new TextEditingController();
  bool isCommentLoading = false;

  bool raporlandi = false;

  @override
  void initState() {
    super.initState();
    PetitionService().getPetition(widget.petition_id).then((value) => setState(() {
      petitionModel = value;
      isLoading=false;
    }));
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void refreshPage() {
      setState(() {
        isLoading = true;
      });
      PetitionService().getPetition(widget.petition_id).then((value) => setState(() {
        petitionModel = value;
        isLoading=false;
      }));
    }

    return PopScope(
      onPopInvoked: (didPop) async {
        await PetitionService().refreshPetitions().then((value) => setState(() {
          widget.resState();
        }));
      },
      child: Scaffold(
        body: isLoading ?
            const Center(
              child: CircularProgressIndicator(),
            )
            : RefreshIndicator(
          onRefresh: () async {
            refreshPage();
          },
          child:  SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SafeArea(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.green[900],
                          ),
                          Text(
                            "Talepler",
                            style: TextStyle(color: Colors.green[900]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10, top: 20,left: 20,right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: petitionModel!.petitionerProfilePhotoSrc == null ?
                                  CircleAvatar(
                                    backgroundColor: Colors.green[100],
                                    foregroundImage: AssetImage(
                                        "assets/images/default.png"
                                    ),
                                  ) : Image.network(
                                    petitionModel!.petitionerProfilePhotoSrc.toString(),
                                    errorBuilder: (context, error, stackTrace) {
                                      return CircleAvatar(
                                        backgroundColor: Colors.green[100],
                                        foregroundImage: AssetImage(
                                            "assets/images/default.png"
                                        ),
                                      );
                                    },
                                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                      return CircleAvatar(
                                        backgroundColor: Colors.green[50],
                                        foregroundImage: NetworkImage(
                                            petitionModel!.petitionerProfilePhotoSrc.toString()
                                        ),
                                      );
                                    },
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${petitionModel!.petitionerName}",overflow: TextOverflow.ellipsis, style: TextStyle(
                                          fontWeight: FontWeight.w600
                                      ),),
                                      Text(timeAgo(petitionModel!.createdAt),overflow: TextOverflow.ellipsis, style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54
                                      ),)
                                    ],
                                  ),
                                  SizedBox(height: 4,),
                                  Text(
                                    petitionModel!.petition.toString(), overflow:  null, maxLines:  null, style: TextStyle(
                                      fontWeight: FontWeight.w500
                                  ),),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      raporlandi = !raporlandi;
                                    });
                                  },
                                  child: Icon(raporlandi ? Iconsax.flag5 : Iconsax.flag4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      petitionModel!.images != null ? CarouselSlider(
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          animateToClosest: true,
                          scrollPhysics: BouncingScrollPhysics(),
                          viewportFraction: .9,
                        ),
                        items: [
                          for(int i = 0; i < petitionModel!.images!.length ; i++)
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Image.network(
                              petitionModel!.images![i].toString(),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.red[100]
                                  ),
                                  child: Center(
                                    child: Icon(Iconsax.image5,size: 80,),
                                  ),
                                );;
                              },
                              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {

                                return Container(
                                  height: screenWidth * 0.35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            petitionModel!.images![i].toString()
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                  ),
                                );
                              },
                                                     ),
                           )
                        ],
                      ) : Container(),
                      petitionModel!.images != null ? SizedBox(height: 16,) : Container(),
                      petitionModel!.answer == null ? Divider(height: 1,color: Colors.black12,) : Container(),
                      petitionModel!.answer == null ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: (){
                                      PetitionService().likePetition(petitionModel!.id!).then((value) => setState(() {
                                        refreshPage();
                                      }));
                                    },
                                    child: Icon(petitionModel?.userReview ?? false ? Iconsax.like_15 : Iconsax.like_1)
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  petitionModel!.likes.toString(),
                                  style:  TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    PetitionService().dislikePetition(petitionModel!.id!).then((value) => setState(() {
                                      refreshPage();
                                    }));
                                  },
                                  child: Icon(!(petitionModel?.userReview ?? true) ? Iconsax.dislike5 : Iconsax.dislike),

                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  petitionModel!.dislikes.toString(),
                                  style:  TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(Iconsax.message_question),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  petitionModel!.comments != null ? petitionModel!.comments!.length.toString() : "0",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Icon(Iconsax.share),
                          ),
                        ],
                      ) : Container(),
                      petitionModel!.answer == null ? Divider(height: 1,color: Colors.black12,) : Container()
                    ],
                  ),
                  petitionModel!.answer == null ? Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: UserService().CurrentUser.profilePhoto == null ?
                                  CircleAvatar(
                                    backgroundColor: Colors.green[100],
                                    foregroundImage: const AssetImage(
                                        "assets/images/default.png"
                                    ),
                                  ) : Image.network(
                                    UserService().CurrentUser.profilePhoto.toString(),
                                    errorBuilder: (context, error, stackTrace) {
                                      return CircleAvatar(
                                        backgroundColor: Colors.green[100],
                                        foregroundImage: const AssetImage(
                                            "assets/images/default.png"
                                        ),
                                      );
                                    },
                                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                      return CircleAvatar(
                                        backgroundColor: Colors.green[50],
                                        foregroundImage: NetworkImage(
                                            UserService().CurrentUser.profilePhoto.toString()
                                        ),
                                      );
                                    },
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: TextField(
                                controller: textEditingController,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(50, 120, 50, 1),
                                    ),
                                  ),
                                  hintText: 'Yorumunuz',
                                  hintStyle:  TextStyle(color: Colors.grey),
                                  fillColor: Colors.white,
                                ),
                                style:  TextStyle(color: Colors.black),
                                cursorColor: Color.fromRGBO(50, 120, 50, 1),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: isCommentLoading ? CircularProgressIndicator() : InkWell(
                                onTap: () {
                                  if(textEditingController.text.isEmpty) {
                                    return;
                                  }
                                  setState(() {
                                    isCommentLoading = true;
                                  });
                                  PetitionService().sendComment(petitionModel!.id!, textEditingController.text).then((value) => setState(() {
                                    isCommentLoading = false;
                                    refreshPage();
                                  }));
                                  textEditingController.clear();
                                },
                                child: Icon(Iconsax.direct_right, size: 30,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1,color: Colors.black12,),
                    ],
                  ) :
                  Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Align(
                              alignment: Alignment.topLeft,
                              child:
                              CircleAvatar(
                                backgroundColor: Colors.green[100],
                                foregroundImage: AssetImage(
                                    "assets/images/pendikprofil.jpg"
                                ),
                              ),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pendik Belediyesi'nin yanıtı",overflow: TextOverflow.ellipsis, style: TextStyle(
                                  fontWeight: FontWeight.w600
                              ),),
                              SizedBox(height: 4,),
                              Text(
                                petitionModel!.answer.toString()
                              , overflow:  null, maxLines:  null, style: TextStyle(
                                  fontWeight: FontWeight.w500
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  petitionModel!.comments != null ?  petitionModel!.comments!.isNotEmpty ? ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 12,
                      );
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:  petitionModel!.comments!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Comments comment = petitionModel!.comments![index];
                      return PetitionCommentWidget(
                        comment: comment,
                      );
                    },
                  ) : const Text("Henüz yorum yapılmamış") : const Text("Bir hata oluştu"),

                  const SizedBox(height: 15,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




