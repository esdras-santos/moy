import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moy/screens/home.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:moy/screens/menu.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
         statusBarColor: Colors.transparent,
         statusBarBrightness: Brightness.dark,
         systemNavigationBarColor: Colors.white,
         systemNavigationBarIconBrightness: Brightness.dark,
      ),
     );
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Moy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}