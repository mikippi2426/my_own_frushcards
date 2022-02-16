import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/images/image_title.png")),
            _titleText(),
            //TODO 横線,
            //TODO かくにんテストをするボタン,
            //TODO ラジオボタン,
            //TODO 単語一覧を見るボタン,
            Text(
              "powered by Suzura LLC 2019",
              style: TextStyle(fontFamily: "Reggae"),
            )
          ],
        ),
      ),
    );
  }

  Widget _titleText() {
    return Column(
      children: [
        Text(
          "私だけの単語帳",
          style: TextStyle(fontSize: 40.0,fontFamily: "Reggae"),
        ),
        Text(
          "My Own Frashcard",
          style: TextStyle(fontSize: 24.0,fontFamily: "Reggae"),
        ),
      ],
    );
  }
}
