// [1] 상태가 없는 위젯 = 재 렌더링 없을때 사용
import 'package:flutter/material.dart';

// [2] 최초로 실행할 위젯 , main함수 안에서 runApp 함수 이용한 위젯 실행
// 상단바에서 실행할 환경 선택( web 또는 mobile )
void main(){ runApp( MyApp() ); }


class MyApp extends StatelessWidget{ // [1-1] StatelessWidget 상속받는다.
  // [1-3]
  int count = 0; // 변수
  void increment (){ count++; print(count);} // 함수

  // [1-2] build 함수 재구현
  @override
  Widget build(BuildContext context) {
    // [1-3] 위젯에 반환할 위젯
    // return MaterialApp( home: Text("안녕하세요"), );
    return MaterialApp( home : Scaffold(
      appBar: AppBar( title: Text("상단제목") ),
      body: Center(
        child: Column(
          children: [
            Text("새로 정렬 첫번째 위젯") ,
            Text("두번째 위젯") ,
            TextButton(onPressed: increment , child: Text("세로 정렬 세번째 위젯3"),),
            // <button onClick = { increment } > 세로 정렬 세번째 위젯3 </button>
            Text("세로 정렬 네번째 위젯4 COUNT : ${count} " )
          ], ), ),

    ) );
  }

} // class end