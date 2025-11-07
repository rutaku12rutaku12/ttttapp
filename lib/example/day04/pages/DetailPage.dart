import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("디테일"),),
      body: Center(
        child: Column(
          children: [
            Text("상세 페이지"),
            ElevatedButton(
                onPressed: (){
                  // 최근의 위젯으로 돌아가기
                  Navigator.pop(context);
                },
                child: Text("뒤로가기"))
          ],
        ),
      ),
    );
  }
}