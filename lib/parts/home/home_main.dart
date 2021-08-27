
import 'package:cizo/parts/home/bottom_navbar.dart';
import 'package:cizo/parts/home/home_page.dart';
import 'package:cizo/parts/profile/profile_main.dart';
import 'package:flutter/material.dart';

class HomeMain extends StatefulWidget {
  HomeMain({Key? key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffFAFAFA),
        bottomNavigationBar: HomeNavBar(pageController: _pageController,),
        body: PageView( controller: _pageController,
          onPageChanged: (int index){

        },
          children: [
            HomePage(),
            ProfilePage(),
          ],
        ));
  }
}
