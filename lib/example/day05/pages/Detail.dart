
import 'package:flutter/material.dart';
import 'package:ttttapp/example/day03/example1.dart';

class Detail extends StatefulWidget{
  DetailState createState()=> DetailState();
}
class DetailState extends State<Detail>{

  // 1. 해당 위젯이 최초로 열렸을때 함수
  @override
  void initState() { }
  // 2. 이전(부모) 위젯이 변경 되었을때 실행 함수, < 렌더링 >
  @override
  void didChangeDependencies() {
    // 부모 위젯에서 상세버튼 클릭할때 마다 서로 다른 매개변수를 가져온다.
    // ModalRoute.of( context )!.settings.arguments as 타입;
    int id = ModalRoute.of(context)!.settings.arguments as int;
    findById(id);
  }

  // 3. Spring 서버로 부터 개별 조회한다.
   dynamic todo = {};
  void findById( int id ) async{
    try{
      final response = await dio.get("http://192.168.40.235:8080/api/todo/detail?id=${id}");
      final data = await response.data; print(data);
      setState(() { todo = data;});
    }catch(e){print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("TODO 상세"),),
      body: Padding( // 안쪽 여백
          padding : EdgeInsets.fromLTRB( 10 , 20 , 30 , 40 ) , // 안쪽 여백
          child: Column(
            crossAxisAlignment : CrossAxisAlignment.start , // 세로 배치 방법에서 정렬
            children: [
              Text("제목 : ${ todo['title'] }" , style: TextStyle( fontSize: 20), ) ,
              SizedBox( height: 10 ,),

              Text("내용 : ${ todo['content'] }" , style: TextStyle(fontSize: 15 , color: Colors.green),) ,
              SizedBox(height: 20,),

              Text("완료 여부 : ${todo['done'] == true ? '완료' : '미 완료'}" ,style: TextStyle(fontSize: 10),),
              SizedBox( height: 20,) ,

              Text("등록일 : ${todo['createDate']}" , style: TextStyle(fontSize: 15), ) ,
            ],
          )
      ),
    );
  }
}