
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../Data/Services/PetitionService.dart';

class SendPetitionScreen extends StatefulWidget {
  @override
  _SendPetitionScreenState createState() => _SendPetitionScreenState();
}

class _SendPetitionScreenState extends State<SendPetitionScreen> {

  TextEditingController textEditingController = new TextEditingController();

  String? petitionError;
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
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth*.05, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green[900],),
                        Text("Geri",style: TextStyle(color: Colors.green[900]),),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Talep Gönder",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: TextField(

                    inputFormatters: [
                      LengthLimitingTextInputFormatter(500),
                    ],
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      errorText: petitionError,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      hintText: 'Talebinizi belirtin',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(50, 120, 50, 1), width: 3),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style:  TextStyle(color: Colors.black),
                    cursorColor: Color.fromRGBO(50, 120, 50, 1),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Wrap(
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
                SizedBox(height: 100,),
                InkWell(
                  onTap: loading ? null : (){
                    setState(() {
                      if (textEditingController.text.isNotEmpty) {
                        loading = true;
                        petitionError = null;
                        PetitionService().makePetition(imagesList, textEditingController.text).then((value) async {
                          await showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Talep Gönderimi'),
                                content:  SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(value ?? 'Talep yapay zeka kontrolünden geçemedi. Saygısızca ifadelerden kaçındığınızdan ve yakın zamanda benzer talepler gönderilmediğinden emin olun.'),
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
                        petitionError = "Talep içeriği boş bırakılamaz!";
                      }
                    });

                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: screenHeight / 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green[900],
                    ),
                    child: loading ?
                        CircularProgressIndicator():
                    Text(
                      "GÖNDER",
                      style:  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
