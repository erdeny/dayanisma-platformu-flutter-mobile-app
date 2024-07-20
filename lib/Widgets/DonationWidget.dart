import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/DonationModel.dart';
import 'package:intl/intl.dart';

class DonationWidget extends StatelessWidget {
  final DonationModel donationModel;
  const DonationWidget({super.key, required this.donationModel});


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.network(
            donationModel.thumbnail.toString(),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 150,
                width: 150,
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
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(donationModel.thumbnail.toString()),
                      fit: BoxFit.cover,
                    )
                ),
              );
            },
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donationModel.productName.toString(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateFormat('dd MMMM yyyy HH:mm', 'tr_TR').format(donationModel.createdAt!).toString(),
                  style:  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  donationModel.status.toString(),
                  style:  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
            
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: donationModel.status == 'Beklemede' ? Colors.grey[900] : donationModel.status == 'Teslim Edildi' ? Colors.green[900] : Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
