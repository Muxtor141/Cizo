import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeNavBar extends StatefulWidget {
  final PageController pageController;
  HomeNavBar({Key? key, required this.pageController}) : super(key: key);

  @override
  _HomeNavBarState createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  bool isHomePage = true;
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    double dropBlur = 0;

    indicateDialog() {
      showDialog(
          barrierColor: Colors.transparent,
          barrierDismissible: true,
          context: context,
          builder: (x) {
            return AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.only(top: heightQuery * 0.44),
              content: Container(
                height: heightQuery * 0.1675,
                width: sizeQuery.width,
                child: Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/base.png',
                        fit: BoxFit.cover,
                      ),
                      height: heightQuery * 0.1675,
                      width: sizeQuery.width,
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: heightQuery * 0.0307,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: sizeQuery.width * 0.16,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 28,
                                    height: 28,
                                    child:
                                        Image.asset('assets/icons/search.png'),
                                  ),
                                  SizedBox(
                                    height: heightQuery * 0.01724,
                                  ),
                                  Text(
                                    'Find Quiz Code',
                                    style: GoogleFonts.nunitoSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Container(
                                    width: 28,
                                    height: 28,
                                    child: Image.asset('assets/icons/list.png'),
                                  ),
                                  SizedBox(
                                    height: heightQuery * 0.01724,
                                  ),
                                  Text(
                                    'Find Public Quiz',
                                    style: GoogleFonts.nunitoSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: sizeQuery.width * 0.16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }).then((value) {});
    }

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: dropBlur, sigmaY: dropBlur),
      child: Container(color: Colors.transparent,
        height: heightQuery * 0.1527,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: heightQuery * 0.0185,
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(
                      left: sizeQuery.width * 0.16,
                      right: sizeQuery.width * 0.16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: heightQuery * 0.03325,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.linear);
                              setState(() {
                                isHomePage = true;
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                'assets/icons/home.png',
                                color: !isHomePage
                                    ? Color(0x33323438)
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              widget.pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.linear);
                              setState(() {
                                isHomePage = false;
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                'assets/icons/person.png',
                                color: isHomePage
                                    ? Color(0x33323438)
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(23)),
                  height: heightQuery * 0.0813,
                  width: sizeQuery.width * 0.176,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        indicateDialog();
                      },
                      child: Container(
                        width: 34,
                        height: 34,
                        child: Image.asset('assets/icons/compass.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
