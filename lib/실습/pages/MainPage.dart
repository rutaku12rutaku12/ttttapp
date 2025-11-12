
import 'package:flutter/material.dart';
import 'package:ttttapp/%EC%8B%A4%EC%8A%B5/pages/CreatePage.dart';
import 'package:ttttapp/%EC%8B%A4%EC%8A%B5/pages/GetPage.dart';
import 'package:ttttapp/%EC%8B%A4%EC%8A%B5/pages/HomePage.dart';

class MainPage extends StatefulWidget{
  MainPageState createState()=>MainPageState();
}

class MainPageState extends State<MainPage>{
  int currentPageIndex = 0;
  dynamic pages = [
    HomePage() ,
    CreatePage() ,
    GetPage() ,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPageIndex, children: pages,),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: (index){setState(()=> { currentPageIndex = index } ); },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.abc, size: 100, color: Colors.amber,) ,
                label: "홈"),
            BottomNavigationBarItem(
                icon: Icon(Icons.create,size: 100, color: Colors.pinkAccent,) ,
                label: "쓰기"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt,size: 100,color: Colors.pinkAccent,) ,
                label: "보기")
          ]),
    );
  }
}