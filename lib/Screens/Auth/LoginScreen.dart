import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Models/UserModel.dart';
import 'package:pesiad_pdplatformu_mobil/Data/Services/UserService.dart';
import 'package:pesiad_pdplatformu_mobil/PageStructure.dart';
import 'package:pesiad_pdplatformu_mobil/Screens/Auth/RegisterScreen.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool loading = false;
  String? emailError;
  String? passwordError;

  Future<void> login(BuildContext context) async {


    final userService = UserService();

    if(_emailController.text.isEmpty) {
      setState(() {
        emailError = "E-Posta boş bırakılamaz!";
      });
    } else {
      setState(() {
        emailError = null;
      });
    }
    if(_passwordController.text.isEmpty) {
      setState(() {
        passwordError = "Şifre boş bırakılamaz!";
      });
    } else {
      setState(() {
        passwordError = null;
      });
    }

    if(emailError != null || passwordError != null) {
      return;
    }

    if (await userService.Login(_emailController.text, _passwordController.text)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PageStructure()),
      );
    } else {
      const snackBar = SnackBar(content: Text("E-Posta adresi veya şifre yanlış!"), backgroundColor: Colors.red,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: screenHeight / 50,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SvgPicture.asset(
                "assets/images/dayanismalogo.svg",
                width: 150,
              ),
            ),
            SizedBox(
              height: screenHeight / 60,
            ),
            Text(
              "Hoşgeldiniz",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            Text(
              "Giriş yap ve devam et",
              style: TextStyle(
                  color: Colors.white,
                ),
            ),
            SizedBox(
              height: screenHeight / 20,
            ),
            Expanded(
              child: Container(
                width: screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight / 35),
                        Text(
                          "E-posta",
                          style:TextStyle(

                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        SizedBox(height: 8),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              errorText: emailError,
                              hintText: 'E-posta adresinizi girin',
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
                              prefixIcon: Icon(Iconsax.message_24),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    _emailController.clear();
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.green,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight / 30,
                        ),
                        Text(
                          "Parola",
                          style:  TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              errorText: passwordError,
                              hintText: 'Parolanızı girin',
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
                              prefixIcon: Icon(Iconsax.password_check4),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    _passwordController.clear();
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.green,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight / 70,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                            Text(
                              'Beni Hatırla',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            Spacer(),
                            InkWell(
                              onTap: (){},
                              child: Text(
                                "Şifremi unuttum",
                                style: TextStyle(
                                    color: Colors.green[900],
                                    fontSize: 16,
                                  ),
                                ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: loading ? null : () {
                            setState(() {
                              loading =true;
                            });
                            login(context).then((v) {
                              setState(() {
                                loading =false;
                              });
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child:loading ? CircularProgressIndicator() : Text(
                              "GİRİŞ YAP",
                              style:
                              TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                            ),
                            width: screenWidth / 1,
                            height: screenHeight / 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.green[900],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight / 50,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                              );
                            },
                            child: Text(
                              "Hesabın yok mu?",
                              style:  TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
