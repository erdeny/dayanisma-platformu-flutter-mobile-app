import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Data/Services/UserService.dart';
import '../../constants.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  PageController _pgController = new PageController();

  String? usernameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;
  String? nameError;
  String? surnameError;
  String? phoneError;

  final userService = UserService();
  bool loading = false;

  Future<void> signup(BuildContext context) async {

    if (_emailController.text.isEmpty) {
      setState(() {
        emailError = 'E-Posta adresi boş bırakılamaz!';
      });
    } else{
      setState(() {
        emailError = null;
      });
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        passwordError = 'Şifre boş bırakılamaz!';
      });
    } else{
      setState(() {
        passwordError = null;
      });
    }

    if (_usernameController.text.isEmpty) {
      setState(() {
        usernameError = 'Kullanıcı adı boş bırakılamaz!';
      });
    } else{
      setState(() {
        usernameError = null;
      });
    }

    if (_nameController.text.isEmpty) {
      setState(() {
        nameError = 'İsim boş bırakılamaz!';
      });
    } else{
      setState(() {
        nameError = null;
      });
    }

    if (_surnameController.text.isEmpty) {
      setState(() {
        surnameError = 'Soyisim boş bırakılamaz!';
      });
    } else{
      setState(() {
        surnameError = null;
      });
    }

    if (_phoneController.text.isEmpty) {
      setState(() {
        phoneError = 'Telefon numarası boş bırakılamaz!';
      });
    } else{
      setState(() {
        phoneError = null;
      });
    }

    if(_passwordController.text.length < 6) {
      setState(() {
        passwordError = 'Şifre 6 karakterden kısa olamaz!';
      });
    } else{
      setState(() {
        passwordError = null;
      });
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        confirmPasswordError = 'Parolalar uyuşmuyor!';
      });
    } else{
      setState(() {
        confirmPasswordError = null;
      });
    }

    if (emailError != null || usernameError != null || phoneError != null || nameError != null || surnameError != null || passwordError != null ||  confirmPasswordError != null ) {
      return;
    }

    String response = await userService.SignUp(_emailController.text, _passwordController.text, _usernameController.text, _phoneController.text, _nameController.text, _surnameController.text);


    if (response == "Başarıyla kayıt olundu") {
      Navigator.pop(context);

    } else {
      SnackBar snackBar = SnackBar(content: Text(response), backgroundColor: Colors.red,);
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
        child: PageView(
          controller: _pgController,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight / 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SvgPicture.asset(
                      "assets/images/dayanismalogo.svg",
                      width: 150,
                    ),
                  ),
                  SizedBox(height: screenHeight / 30),
                  Text(
                    "Hoşgeldiniz",
                    style:  TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  Text(
                    "Hesap bilgilerini doldur",
                    style:  TextStyle(
                        color: Colors.white,
                      ),
                  ),
                  SizedBox(height: screenHeight / 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(320),
                          ],
                          controller: _emailController,

                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            errorText: emailError,
                            labelText: 'E-posta',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                        ),
                        SizedBox(height: screenHeight / 50),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(11),
                          ],
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Telefon Numarası',
                            errorText: phoneError,

                            labelStyle:  TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                        ),
                        SizedBox(height: screenHeight / 50),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(128),
                          ],
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Şifre',
                            errorText: passwordError,

                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          cursorColor: Colors.white,
                        ),
                        SizedBox(height: screenHeight / 50),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(128),
                          ],
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Şifreyi Onayla',
                            errorText: confirmPasswordError,

                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),

                          obscureText: true,
                          cursorColor: Colors.white,
                        ),
                        SizedBox(height: screenHeight / 20),
                        ElevatedButton(
                          onPressed: () {
                            _pgController.animateToPage(1, duration: Duration(milliseconds: 800), curve: Curves.fastEaseInToSlowEaseOut);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15,
                            ),
                            child: Text(
                              'DEVAM ET',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight / 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight / 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SvgPicture.asset(
                      "assets/images/dayanismalogo.svg",
                      width: 150,
                    ),
                  ),
                  SizedBox(height: screenHeight / 30),
                  Text(
                    "Az kaldı",
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Kendini tanıt ve kayıt ol",
                    style:  TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight / 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50),
                          ],
                          controller: _usernameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'Kullanıcı Adın',
                            errorText: usernameError,

                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                        ),
                        SizedBox(height: screenHeight / 50),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(60),
                          ],
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'Adın',
                            errorText: nameError,

                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                        ),
                        SizedBox(height: screenHeight / 50),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(60),
                          ],
                          controller: _surnameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'Soyadın',
                            errorText: surnameError,

                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                        ),
                        SizedBox(height: screenHeight / 20),
                        ElevatedButton(
                          onPressed: loading ? null :() {
                            setState(() {
                              loading = true;
                            });
                            signup(context).then((v) {
                              setState(() {
                                loading = false;
                              });
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15,
                            ),
                            child: loading? CircularProgressIndicator(): Text(
                              'KAYIT OL',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight / 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
