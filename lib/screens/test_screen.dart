import 'package:flutter/material.dart';


enum TestStatus {BEFORE_START, SHOW_QUESTION, SHOW_ANSWER, FINISHED}

class TestScreen extends StatefulWidget {
  final bool isIncludedMemorizedWords;


  TestScreen({required this.isIncludedMemorizedWords});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _numberOfQuestion = 0;

  String _textQuestion="テスト";//TODO

  String _textAnswer="こたえ";//TODO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("かくにんテスト"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Fab押せたで～"),//TODO
        child: Icon(Icons.skip_next),
        tooltip: "次にすすむ",
      ),
      body: Column(
        children: [
          SizedBox(height: 10.0,),
          _numberOfQuestionsPart(),
          SizedBox(height: 20.0,),
          _questionCardPart(),
          SizedBox(height:10.0,),
          _answerCardPart(),
          _isMemorizedCheckPart(),
        ],
      ),
    );
  }
  //TODO 残り問題数表示部分
  Widget _numberOfQuestionsPart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("のこり問題数",style: TextStyle(fontSize: 14.0),),
        SizedBox(width: 30.0,),
        Text(_numberOfQuestion.toString(),style: TextStyle(fontSize: 24.0),),
      ],
    );
  }

  //問題カード表示部分
 Widget _questionCardPart() {
    return Stack(
      alignment: Alignment.center,
      children:[
      Image.asset("assets/images/image_flash_question.png"),
      Text(_textQuestion,style: TextStyle(color: Colors.grey[800],fontSize: 20.0),)
   ],
    );
  }
  //TODO こたえカード
  Widget _answerCardPart() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/image_flash_answer.png"),
        Text(_textAnswer,style: TextStyle(fontSize: 20.0),),
      ],
    );
  }
  //TODO 暗記済みチェック部分
  Widget _isMemorizedCheckPart() {
    return Container();
  }
}
