import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttttapp/%EC%8B%A4%EC%8A%B5/pages/CreatePage.dart';

class GetPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("조회"),),
      body: Text("조회 페이지"),
    );
  }
}

class TodoWidget extends StatefulWidget{
  TodoWidgetState createState() => TodoWidgetState();
}

class TodoWidgetState extends State<TodoWidget>{
  void getTodoList() async{
    try{
      final dio = Dio();
      final response = await dio.get("http://192.168.40.235:8080/api/todo");
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
     return Expanded(child: ListView.builder(
         itemCount: todoList.legth,
          itemBuilder: ( context , index ){
           dynamic todos = todoList[index];

           return Card(child: ListTile(
             title: Text(todos['title'] ),
             subtitle: Text(todos['content'] ),
           ) );
          } )
     );
  }
}