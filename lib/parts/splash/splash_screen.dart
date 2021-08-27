import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAnimated = false;
  Widget _widget = Container();
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        isAnimated = true;
        _widget = Container(
          decoration: BoxDecoration(
              color: Color(0xff14C1FA),
              borderRadius: BorderRadius.circular(17)),
          width: 76,
          height: 76,
          child: Image.asset('assets/images/logo.png'),
        );
      });
    });

    Future.delayed(
        Duration(
          milliseconds: 3500,
        ), () {
      var firebase = FirebaseAuth.instance;

      firebase.userChanges().listen((User? user) {
        if (user == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, "onboard", (route) => false);
          print('User is currently signed out!');
        } else {
          Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
        }
      });
    });
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 100),
            child: AnimatedSwitcher(
              child: _widget,
              switchOutCurve: Curves.bounceIn,
              duration: Duration(milliseconds: 2000),
            ),
          ),
        ),
      ),
    );
  }
}
