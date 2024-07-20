import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import '../../Data/Services/DonationService.dart';

class RequestDonationScreen extends StatefulWidget {
  @override
  _RequestDonationScreenState createState() => _RequestDonationScreenState();
}


class _RequestDonationScreenState extends State<RequestDonationScreen> {

  TextEditingController addressTxtController = new TextEditingController();
  TextEditingController phoneNumberTxtController = new TextEditingController();
  TextEditingController nameTxtController = new TextEditingController();
  TextEditingController descriptionTxtController = new TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20,left: 30),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green[900],),
                      Text("Geri",style: TextStyle(color: Colors.green[900]),),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    width: screenWidth/1.2,
                    child: ClipRRect(
                      child: Image.asset("assets/images/ihtiyacard2.png"),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: screenWidth / 1.2,
                child: TextField(
                  controller: nameTxtController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(255),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Ad ve soyad girin',
                    hintStyle:TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Iconsax.personalcard),
                  ),
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: screenWidth / 1.2,
                child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(255),
                  ],
                  controller: addressTxtController,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Adres bilgileri girin',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Iconsax.location_add),
                  ),
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: screenWidth / 1.2,
                child: TextField(
                  controller: phoneNumberTxtController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Telefon numarası girin',
                    hintStyle:  TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Iconsax.call_add),
                  ),
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: screenWidth / 1.2,
                child: TextField(
                  controller: descriptionTxtController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4000),
                  ],
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Açıklama',
                    hintStyle:  TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Iconsax.message_text),
                  ),
                  style:  TextStyle(color: Colors.black),
                  cursorColor: Colors.green,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: loading ? null : (){
                  setState(() {
                    if (nameTxtController.text.isNotEmpty && phoneNumberTxtController.text.isNotEmpty && addressTxtController.text.isNotEmpty && descriptionTxtController.text.isNotEmpty) {
                      if(nameTxtController.text.length <3) {
                        const snackBar = SnackBar(content: Text("Ad ve soyad en az 3 karakter olmalı!"), backgroundColor: Colors.red,);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }

                      if(descriptionTxtController.text.length <10) {
                        const snackBar = SnackBar(content: Text("Açıklama en az 10 karakter olmalı!"), backgroundColor: Colors.red,);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }

                      loading = true;

                      DonationService().askDonation(nameTxtController.text, addressTxtController.text, phoneNumberTxtController.text, descriptionTxtController.text).then((value) async {
                        await showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Bağış Talebi Yapıldı'),
                              content:  SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Bağış talebiniz işleme alındı.'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Tamam'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        loading = false;
                        Navigator.of(context).pop();
                      });

                    } else {
                      const snackBar = SnackBar(content: Text("Alanların hepsi doldurulmak zorunda!"), backgroundColor: Colors.red,);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });

                },
                child: Container(
                  alignment: Alignment.center,
                  child:loading ?
                  CircularProgressIndicator(): Text(
                    "GÖNDER",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  width: screenWidth / 1.2,
                  height: screenHeight / 13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green[900],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}