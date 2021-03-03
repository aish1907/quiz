import 'package:flutter/material.dart';
import 'package:flutter_app4/questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {

  int quesno=0;
  int score=0;
  Questions questions = Questions();

  void updats(int quesno,bool val) {
    if (questions.questbank[quesno].ans == val) {
      setState(() {
        score++;
      });
    }
  }

    void incq(){
      setState(() {
        quesno++;
      });
    }



  bool checkQ(int quesno){
    return quesno < questions.questbank.length? true:false;
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
      child:Scaffold(appBar: AppBar(title: Text("heel")),
       body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center( child:Text(checkQ(quesno)? questions.questbank[quesno].quest.toString() : "End",style: TextStyle(
            fontSize: 40.0,
          ),),

          ),
          SizedBox( height: 10,),
          if(checkQ(quesno))
            RaisedButton(
              child: Text("true",
                style: TextStyle(
                  fontSize: 40.0,
                ),),

              onPressed:(){
                setState(() {
                  updats(quesno,true);
                  incq();
                });
              }
            ),
          SizedBox( height: 10,),
          if(checkQ(quesno))
            RaisedButton(child: Text("false",
            style: TextStyle(
              fontSize: 40.0
            )),
                onPressed:(){
                setState(() {
                updats(quesno,false);
                incq();
                });
                }),
            SizedBox(
              height: 10,
            ),
        Center(child:Text("Current Score $score",style: TextStyle(
          fontSize: 40.0,
        ),))
       ],
       )
      )
    ),
    );
  }


}
