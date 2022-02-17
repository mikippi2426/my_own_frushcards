import 'package:flutter/material.dart';
import 'package:my_own_frushcards/parts/button_with_icon.dart';

class HomeScreen extends StatefulWidget {

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
            Divider(
              height: 30.0,
              color: Colors.white,
              indent: 8.0,
              endIndent: 8.0,
              thickness: 1.0,
            ),
            //TODO かくにんテストをするボタン,
            ButtonWithIcon(
              onPressed: () => print("かくにんテスト"), //TODO,
              icon: Icon(Icons.play_arrow),
              label: "かくにんテストをする",
              color: Colors.brown,
            ),
            //TODO ラジオボタン,
            //単語一覧を見るボタン,
            ButtonWithIcon(
              onPressed: () => print("単語一覧"), //TODO
              icon: Icon(Icons.list),
              label: "単語一覧を観る",
              color: Colors.grey,
            ),
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
          style: TextStyle(fontSize: 40.0, fontFamily: "Reggae"),
        ),
        Text(
          "My Own Frashcard",
          style: TextStyle(fontSize: 24.0, fontFamily: "Reggae"),
        ),
      ],
    );
  }
}
