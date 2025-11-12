import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetPage extends StatefulWidget{
  GetPageState createState() => GetPageState();
}

class GetPageState extends State<GetPage>{

  void getTodoList() async{
    try{
      final dio = Dio();
      final response = await dio.get("http://10.0.2.2:8080/api/todo");
      final data = response.data;
      print(data);
      setState(() { todoList = data; } );
    }catch(e){print(e);}
  }
  // 최초 조회 1회실행
  @override
  void initState() { getTodoList(); }
  // dio로 가져온 데이터 저장하는 상태 변수
  dynamic todoList = [];

  @override
    Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text("할 일 목록") ,),
       body: Column(
         children: [
             Expanded(child: ListView.builder(
             itemCount: todoList.length,
                 itemBuilder: ( context , index ){
                   dynamic todos = todoList[index];

                   return Card(child: ListTile(
                     title: Text(todos['title'] ),
                     subtitle: Text(todos['content'] ),
                   ) );
                 } )
           )
         ],
       ),
     );
  }
}