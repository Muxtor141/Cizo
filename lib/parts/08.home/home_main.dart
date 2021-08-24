import 'package:cizo/parts/08.home/bottom_navbar.dart';
import 'package:cizo/parts/08.home/home_page.dart';
import 'package:flutter/material.dart';

class HomeMain extends StatefulWidget {
  HomeMain({Key? key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: HomeNavBar(),
      body: 
          HomePage(),
    );
  }
}
