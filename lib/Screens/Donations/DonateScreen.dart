import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/DonationService.dart';

class DonateScreen extends StatefulWidget {
  @override
  _DonateScreenState createState() => _DonateScreenState();
}


class _DonateScreenState extends State<DonateScreen> {

  TextEditingController productNameTxtController = new TextEditingController();
  TextEditingController addressTxtController = new TextEditingController();
  TextEditingController phoneNumberTxtController = new TextEditingController();
  TextEditingController nameTxtController = new TextEditingController();
  TextEditingController descriptionTxtController = new TextEditingController();


  final picker = ImagePicker();
  List<File> imagesList = [];

  Future pickImageFromGallery() async {
    XFile? xfilePick = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (xfilePick != null) {
        imagesList.add(File(xfilePick.path));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Bir şey seçilmedi"),));
      }
    });



  }

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
                      child: Image.asset("assets/images/ihtiyacard4.png"),
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
                  controller: addressTxtController,
                  maxLines: null,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(255),
                  ],
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
                    prefixIcon: Icon(Iconsax.call_add),
                  ),
                  style:  TextStyle(color: Colors.black),
                  cursorColor: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: screenWidth / 1.2,
                child: TextField(
                  controller: productNameTxtController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Ürün Adı',
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
                    prefixIcon: Icon(Iconsax.box),
                  ),
                  style:  TextStyle(color: Colors.black),
                  cursorColor: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: screenWidth / 1.2,
                child: TextField(
                  controller: descriptionTxtController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(2000),
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
                height: 16,
              ),
              Container(
                width: screenWidth / 1.2,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runSpacing: 5.0,
                  spacing: 5.0,
                  children: [
                    for(int i = 0; i < imagesList.length ; i++)
                      Stack(

                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: FileImage(
                                        imagesList[i]
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.cancel, color: Colors.grey[900],),
                            onPressed: () {
                              setState(() {
                                imagesList.removeAt(i);
                              });
                            },
                          )
                        ],
                      ),
                    GestureDetector(
                      onTap: () {
                        pickImageFromGallery();
                      },
                      child: Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black87, width: 3)
                        ),
                        child: Center(
                          child: Icon(
                            Iconsax.add,
                            size: 64,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: loading ? null : (){
                  setState(() {
                    if (productNameTxtController.text.isNotEmpty && nameTxtController.text.isNotEmpty && phoneNumberTxtController.text.isNotEmpty && addressTxtController.text.isNotEmpty && descriptionTxtController.text.isNotEmpty && imagesList.isNotEmpty) {
                      if(productNameTxtController.text.length <3) {
                        const snackBar = SnackBar(content: Text("Ürün adı en az 2 karakter olmalı!"), backgroundColor: Colors.red,);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }

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

                      DonationService().makeDonation(imagesList, nameTxtController.text, addressTxtController.text, phoneNumberTxtController.text, productNameTxtController.text, descriptionTxtController.text).then((value) async {
                        await showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Bağış Gönderimi'),
                              content:  SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Bağışınız işleme alındı.'),
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

                    }
                    else {
                      const snackBar = SnackBar(content: Text("Tüm alanlar doldurulmak zorunda ve görsel içerik zorunlu"), backgroundColor: Colors.red,);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });

                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: loading ?
                  CircularProgressIndicator(): Text(
                    "GÖNDER",
                    style:  TextStyle(
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