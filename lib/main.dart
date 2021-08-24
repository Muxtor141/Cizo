
import 'package:cizo/parts/02.Onboarding/main.dart';
import 'package:cizo/parts/03-05.Auth/login_part.dart';
import 'package:cizo/parts/03-05.Auth/auth_main.dart';
import 'package:cizo/parts/03-05.Auth/signup_part.dart';
import 'package:cizo/parts/04.setup/main.dart';
import 'package:cizo/parts/08.home/home_main.dart';
import 'package:cizo/parts/08.home/quiz_found.dart';
import 'package:cizo/parts/08.home/quiz_not_found.dart';
import 'package:cizo/parts/leaderboard/leaderboard.dart';
import 'package:cizo/parts/profile/dialog.dart';
import 'package:cizo/parts/profile/profile_main.dart';
import 'package:cizo/parts/public-quiz/publics_main.dart';
import 'package:cizo/parts/quiz/quiz_main.dart';
import 'package:cizo/parts/quiz/result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(backgroundColor: Color(0xffFAFAFA),
      scaffoldBackgroundColor:Color(0xffFAFAFA) ,
      primaryColorDark: Color(0xff323438),
        primaryColor: Color(0xff14C1FA),
        errorColor: Color(0xffF31629),
        primarySwatch: Colors.blue,
      ),

      home: MyHomePage(),
      routes: {
        'auth':(c)=>AuthMain(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ProfilePage(),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
