import 'package:flutter/material.dart';
import 'package:my_own_frushcards/main.dart';
import '../db/database.dart';
import 'edit_screen.dart';

class WordListScreen extends StatefulWidget {
  const WordListScreen({Key? key}) : super(key: key);

  @override
  _WordListScreenState createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {

  List<Word> _wordList= [];

  @override
  void initState() {
    super.initState();
    _getAllWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("単語一覧"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _addNewWord(), //TODO
          child: Icon(Icons.add),
          tooltip: "新しい単語の登録"),
      body: Center(child: Text("単語一覧画面")), //TODO
    );
  }

  _addNewWord() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(
        builder: (context) => EditScreen()
        ));
  }

  void _getAllWords() async{
    _wordList = await database.allWords;
  }
}
