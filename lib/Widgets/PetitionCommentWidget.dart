import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/DetailedPetitionModel.dart';

import '../Utils.dart';

class PetitionCommentWidget extends StatefulWidget {
  PetitionCommentWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comments comment;

  @override
  State<PetitionCommentWidget> createState() => _PetitionCommentWidgetState();
}

class _PetitionCommentWidgetState extends State<PetitionCommentWidget> {
  bool raporlandi = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
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
                    child: widget.comment.commenterProfilePhotoSrc == null ?
                    CircleAvatar(
                      backgroundColor: Colors.green[100],
                      foregroundImage: AssetImage(
                          "assets/images/default.png"
                      ),
                    ) : Image.network(
                      widget.comment.commenterProfilePhotoSrc.toString(),
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
                              widget.comment.commenterProfilePhotoSrc.toString()
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
                        Text("${widget.comment.commenterName}",overflow: TextOverflow.ellipsis, style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),),
                        Text(timeAgo(widget.comment.createdAt),overflow: TextOverflow.ellipsis, style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black54
                        ),)
                      ],
                    ),
                    SizedBox(height: 4,),
                    Text(widget.comment.content.toString(),overflow: null, maxLines: null, style: TextStyle(
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
        Divider(height: 1,color: Colors.black12,),
      ],
    );
  }
}