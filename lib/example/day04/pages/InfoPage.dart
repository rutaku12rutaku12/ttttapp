
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("정보") ),
      body: Text("정보 페이지"),
    );
  }
}
// 리액트에서는 : 컴포넌트페이지 생성 시 , 라우터 경로 등록 , Link to