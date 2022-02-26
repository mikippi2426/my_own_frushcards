import 'package:flutter/material.dart';
import 'package:my_own_frushcards/db/database.dart';
import 'package:my_own_frushcards/main.dart';

enum TestStatus { BEFORE_START, SHOW_QUESTION, SHOW_ANSWER, FINISHED }

class TestScreen extends StatefulWidget {
  final bool isIncludedMemorizedWords;

  TestScreen({required this.isIncludedMemorizedWords});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _numberOfQuestion = 0;
  String _textQuestion = "テスト"; //TODO
  String _textAnswer = "こたえ";
  bool _isMemorized = false; //TODO

  List<Word> _testDataList = [];

  late TestStatus _testStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTestData();
  }
  void _getTestData() async{
    if(widget.isIncludedMemorizedWords){
      _testDataList = await database.allWords;
    }else{
      _testDataList =await database.allWordsExcludedMemorized;
    }

    _testDataList.shuffle();
    _testStatus = TestStatus.BEFORE_START;
    print(_testDataList.toString());
    setState(() {
      _numberOfQuestion = _testDataList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("かくにんテスト"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goNextStatus(),
        child: Icon(Icons.skip_next),
        tooltip: "次にすすむ",
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          _numberOfQuestionsPart(),
          SizedBox(
            height: 20.0,
          ),
          _questionCardPart(),
          SizedBox(
            height: 10.0,
          ),
          _answerCardPart(),
          SizedBox(
            height: 10.0,
          ),
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
        Text(
          "のこり問題数",
          style: TextStyle(fontSize: 14.0),
        ),
        SizedBox(
          width: 30.0,
        ),
        Text(
          _numberOfQuestion.toString(),
          style: TextStyle(fontSize: 24.0),
        ),
      ],
    );
  }

  //問題カード表示部分
  Widget _questionCardPart() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/image_flash_question.png"),
        Text(
          _textQuestion,
          style: TextStyle(color: Colors.grey[800], fontSize: 20.0),
        )
      ],
    );
  }

  //TODO こたえカード
  Widget _answerCardPart() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/image_flash_answer.png"),
        Text(
          _textAnswer,
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }

  //TODO 暗記済みチェック部分
  Widget _isMemorizedCheckPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: CheckboxListTile(
        title: Text(
          "暗記済にする場合はチェックを入れて下さい",
          style: TextStyle(fontSize: 12.0),
        ),
        value: _isMemorized,
        onChanged: (value) {
          setState(() {
            _isMemorized = value!;
          });
        },
      ),
    );
  }

  _goNextStatus() {
    switch(_testStatus){
      case TestStatus.BEFORE_START:
        _testStatus = TestStatus.SHOW_QUESTION;
        break;
      case TestStatus.SHOW_QUESTION:
        _testStatus = TestStatus.SHOW_ANSWER;
        break;
      case TestStatus.SHOW_ANSWER:
        if (_numberOfQuestion <= 0){
          _testStatus = TestStatus.FINISHED;
        }else {
          _testStatus = TestStatus.SHOW_QUESTION;
        }
        break;
      case  TestStatus.FINISHED:
        break;
    }
  }


}
