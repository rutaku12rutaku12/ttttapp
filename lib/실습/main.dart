import 'package:flutter/material.dart';
import 'package:ttttapp/%EC%8B%A4%EC%8A%B5/pages/CreatePage.dart';
import 'package:ttttapp/%EC%8B%A4%EC%8A%B5/pages/GetPage.dart';
import 'package:ttttapp/%EC%8B%A4%EC%8A%B5/pages/HomePage.dart';
import 'package:ttttapp/%EC%8B%A4%EC%8A%B5/pages/MainPage.dart';

void main(){
  runApp( MyApp() );

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => MainPage() ,
        "/home" : (context) => HomePage(),
        "/create" : (context) => CreatePage() ,
        "/get" : (context) => GetPage() ,
      },
    );
  }
}