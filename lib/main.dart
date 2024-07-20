import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'Screens/Auth/LoginScreen.dart';

void main() {
  initializeDateFormatting('tr_TR', null);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        fontFamily: 'Exo2'
      ),
      home: LoginScreen()));
}

