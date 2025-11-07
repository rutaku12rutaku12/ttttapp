
import 'package:flutter/material.dart';
import 'package:ttttapp/example/day04/pages/DetailPage.dart';
import 'package:ttttapp/example/day04/pages/HomePage.dart';
import 'package:ttttapp/example/day04/pages/InfoPage.dart';
import 'package:ttttapp/example/day04/pages/SettingPage.dart';

class MainPage extends StatefulWidget{
  MainPageState createState()=>MainPageState();
}

// 아래 클래스 통채가 다 상태(state)다.
class MainPageState extends State<MainPage>{ // 상태(state)가 있는 위젯
  int  currentPageIndex = 0; // 현재 화면에 보이는 페이지 (인덱스) 번호
  // 인덱스별 위젯(페이지) 목록
  dynamic pages = [ // vs List<Widget> pages = [];
    HomePage() , // 인덱스 0 -> 홈 페이지
    InfoPage() , // 인덱스 1 -> 정보 페이지
    SettingPage() ,
    DetailPage() ,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 기본 앱바 바디 제공
      body: IndexedStack( index: currentPageIndex, children: pages, ), //
      bottomNavigationBar: BottomNavigationBar( // 현재 선택 된 버튼 번호 설정
        backgroundColor: Colors.tealAccent,
        currentIndex: currentPageIndex,
        onTap: (index){ setState(()=>{ currentPageIndex = index } ); } , // 바텀메뉴 중 하나의 탭 눌렀을때
        items: [ // 바텀메뉴에 들어갈 버튼들
          BottomNavigationBarItem(
              icon: Icon(Icons.adb , color: Colors.lightGreen, size: 100,) ,
              label : '홈' ), // 0번
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box , size: 100 , color: Colors.orange,) ,
              label: '정보' ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 100 ,color: Colors.pinkAccent,),
              label: "설정")
          ]
      ),
    );
  }
}