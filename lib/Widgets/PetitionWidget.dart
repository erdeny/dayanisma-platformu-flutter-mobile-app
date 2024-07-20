import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/DetailedPetitionModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/LightPetitionModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/PetitionService.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/UserService.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/Petitions/PetitionDetailsScreen.dart';
import 'package:pesiad_pdplatformu_mobil/Utils.dart';

class PetitionWidget extends StatefulWidget {
  const PetitionWidget({
    super.key,
    required this.petitionModel,
    required this.resState
  });

  final LightPetitionModel petitionModel;
  final Function resState;

  @override
  State<PetitionWidget> createState() => _PetitionWidgetState();
}

class _PetitionWidgetState extends State<PetitionWidget> {
  bool raporlandi = false;



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PetitionDetailsScreen(resState: widget.resState,petition_id: widget.petitionModel.id!,)),
        );
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: widget.petitionModel.petitionerProfilePhotoSrc == null ?
                      CircleAvatar(
                        backgroundColor: Colors.green[100],
                        foregroundImage: AssetImage(
                            "assets/images/default.png"
                        ),
                      ) : Image.network(
                        widget.petitionModel.petitionerProfilePhotoSrc.toString(),
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
                                widget.petitionModel.petitionerProfilePhotoSrc.toString()
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
                          Text("${widget.petitionModel.petitionerName}",overflow: TextOverflow.ellipsis, style: TextStyle(
                            fontWeight: FontWeight.w600
                          ),),
                          Text(timeAgo(widget.petitionModel.createdAt),overflow: TextOverflow.ellipsis, style: TextStyle(
                              fontWeight: FontWeight.w400,
                            color: Colors.black54
                          ),)
                        ],
                      ),
                      SizedBox(height: 4,),
                      Text(widget.petitionModel.petition.toString(),overflow: widget.petitionModel.images != null ? TextOverflow.ellipsis : null, maxLines: widget.petitionModel.images != null ? 1 : null, style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),),
                      widget.petitionModel.images != null ? SizedBox(height: 8,) : Container(),
                      widget.petitionModel.images != null ? Stack(
                        children: [
                          Image.network(
                            widget.petitionModel.images![0].toString(),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: screenWidth * 0.35,
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
                                      image: NetworkImage(widget.petitionModel.images![0].toString()),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              );
                            },
                          ),
                          widget.petitionModel.images!.length > 1 ? Align(
                            alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("+${widget.petitionModel.images!.length-1}", style: TextStyle(
                                  color: Colors.white
                                ),),
                                SizedBox(width: 4,),
                                Icon(Iconsax.image5,color: Colors.white,size: 16,)
                              ],
                            ),
                          ),
                          ) :
                              Container()
                        ],
                      ) : Container(),
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
          Divider(height: 1,color: Colors.black12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    InkWell(
                        onTap: (){
                          PetitionService().likePetition(widget.petitionModel.id!).then((value) => setState(() {
                            PetitionService().refreshPetitions().then((value) => widget.resState());
                          }));
                        },
                        child: Icon(widget.petitionModel.userReview ?? false ? Iconsax.like_15 : Iconsax.like_1)
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.petitionModel.likes.toString(),
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
                        PetitionService().dislikePetition(widget.petitionModel.id!).then((value) => setState(() {
                          PetitionService().refreshPetitions().then((value) => widget.resState());
                        }));
                      },
                      child: Icon(!(widget.petitionModel.userReview ?? true) ? Iconsax.dislike5 : Iconsax.dislike),

                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.petitionModel.dislikes.toString(),
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
                      widget.petitionModel.commentCount.toString(),
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
          ),
          Divider(height: 1,color: Colors.black12,)
        ],
      ),
    );
  }
}