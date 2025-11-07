import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("등록"),),
      body: Text("등록 페이지"),
    );
  }
}
// 위젯 만들기 (컴포넌트)
class TodoWidget extends StatefulWidget{
  TodoWidgetState createState() => TodoWidgetState();
}

// 상태 하위 위젯
class TodoWidgetState extends State<TodoWidget> {

  // 입력상자 컨트롤러
  TextEditingController titleCont = TextEditingController();
  TextEditingController conCont = TextEditingController();


  // POST 함수
  void createTodo() async {
    print(titleCont.text);
    final obj = {
      'title' : titleCont.text,
      'content' : conCont.text,
    }; print(obj);
    try {
      final dio = Dio();
      final response = await dio.post(
          "http://192.168.40.235:8080/api/todo", data: obj);
      print(response.data);
    }catch(e){print(e);}
  }

  void getTodoList() async{
    try{
      final dio = Dio();
      final response = await dio.get("http://192.168.40.235:8080/api/goods/list");
      final data = response.data;
      print(data);
      setState(() { todoList = data; } );
    }catch(e){print(e);}
  }
  // 최초 조회 1회실행
  void initState() { getTodoList(); }
  // dio로 가져온 데이터 저장하는 상태 변수
  dynamic todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("할 일 "),),
      body:
    );
  }
}