import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/Events/EventDetailsScreen.dart';
import '../Data/Models/EventModel.dart';

class EventWidget extends StatelessWidget {
  final EventModel event;

  const EventWidget({
    required this.event,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EventDetailsScreen(event: event),)
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network( // Loading falan ekle
                event.thumbnailSrc.toString(),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: screenWidth * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red[200]
                    ),
                    child: Center(
                      child: Icon(Iconsax.picture_frame2),
                    ),
                  );;
                },
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {

                  return Container(
                    height: screenWidth * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(event.thumbnailSrc.toString()),
                          fit: BoxFit.cover,
                        )
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                event.title.toString() ,

                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              SizedBox(
                height: 1,
              ),
              Text(
                  event.timeLeft(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12,
                  ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Iconsax.location5,
                      color: Colors.green[900],
                      size: 20,
                    ),
                  ),
                  Flexible(

                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        event.address.toString() ,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(

                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                      child: Icon(
                        Iconsax.arrow_right_3,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
