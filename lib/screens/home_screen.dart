import 'package:flutter/material.dart';
import 'package:my_own_frushcards/parts/button_with_icon.dart';
import 'package:my_own_frushcards/screens/test_screen.dart';
import 'package:my_own_frushcards/screens/world_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isIncludedMemorizedWords = false;

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
            //かくにんテストをするボタン,
            ButtonWithIcon(
              onPressed: () => _startTestScreen(context), //
              icon: Icon(Icons.play_arrow),
              label: "かくにんテストをする",
              color: Colors.brown,
            ),
            SizedBox(
              height: 10.0,
            ),
            //ラジオボタン,
            _radioButtons(),
            //単語一覧を見るボタン,
            ButtonWithIcon(
              onPressed: () => _startWordListScreen(context), //
              icon: Icon(Icons.list),
              label: "単語一覧を観る",
              color: Colors.grey,
            ),
            SizedBox(
              height: 60.0,
            ),
            Text(
              "powered by Suzura LLC 2019",
              style: TextStyle(fontFamily: "Reggae"),
            ),
            SizedBox(
              height: 16.0,
            ),
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

  Widget _radioButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
      child: Column(
        children: [
          RadioListTile(
            value: false,
            groupValue: isIncludedMemorizedWords,
            onChanged: (bool? value) => _onRadioSelected(value!),
            title: Text(
              "暗記済みの単語を除外する",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          RadioListTile(
            value: true,
            groupValue: isIncludedMemorizedWords,
            onChanged: (bool? value) => _onRadioSelected(value!),
            title: Text(
              "暗記済みの単語を含む",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  _onRadioSelected(bool value) {
    setState(() {
      isIncludedMemorizedWords = value;
      print("$valueが選ばれたで～");
    });
  }

  _startWordListScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WordListScreen()));
  }

  _startTestScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TestScreen(
                isIncludedMemorizedWords: isIncludedMemorizedWords)));
  }
}
