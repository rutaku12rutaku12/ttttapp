import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


// 위젯 만들기 (컴포넌트)
class CreatePage extends StatefulWidget{

  CreatePageState createState() => CreatePageState();
}

// 상태 하위 위젯
class CreatePageState extends State<CreatePage> {

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
          "http://10.0.2.2:8080/api/todo", data: obj);
      print(response.data);
    }catch(e){print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("할 일 목록 "),),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "제목"),
                controller: titleCont,
              ),
               SizedBox(height: 100,),

              TextField(
                decoration: InputDecoration(labelText: "내용"),
                controller: conCont,
              ),
              SizedBox(height: 100,),

              ElevatedButton(onPressed: createTodo, child: Text("할 일 등록") ),
            ],
          ),
      )
    );
  }
}