import 'package:flutter/material.dart';
import 'package:my_own_frushcards/db/database.dart';
import 'package:my_own_frushcards/screens/home_screen.dart';

late MyDatabase database;

void main(){
  database = MyDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "わたしだけの単語帳",
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
