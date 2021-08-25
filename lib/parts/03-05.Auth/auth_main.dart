import 'package:cizo/parts/03-05.Auth/login_part.dart';
import 'package:cizo/parts/03-05.Auth/signup_part.dart';
import 'package:cizo/parts/03-05.Auth/textfield.dart';
import 'package:cizo/services/auth/auth_cubits.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthMain extends StatefulWidget {
  AuthMain({Key? key}) : super(key: key);

  @override
  _AuthMainState createState() => _AuthMainState();
}

class _AuthMainState extends State<AuthMain> {
  var _cubit = IsLoginCubit();
  bool isLoginPage = true;

  Color _tabBack = Color(0xff14C1FA);

  Color _tabText = Colors.white;

  @override
  Widget build(BuildContext context) {
    var currentWidget = isLoginPage ? AuthLogin() : AuthSignUp();
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          top: false,
          child: Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  height:
                      isLoginPage ? heightQuery * 0.2 : heightQuery * 0.096),
              // SizedBox(
              //   height: heightQuery * 0.096,
              // ),
              Expanded(
                  child: Container(
                      child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(
                                top: heightQuery * 0.0615,
                              ),
                              padding: EdgeInsets.only(
                                  left: sizeQuery.width * 0.067,
                                  right: sizeQuery.width * 0.067),
                              width: sizeQuery.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: heightQuery * 0.0812,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          color: Color(0x1A14C1FA),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: heightQuery * 0.0825,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            height: heightQuery * 0.0677,
                                            onPressed: () {
                                              setState(() {
                                                isLoginPage = true;
                                              });
                                            },
                                            color: isLoginPage
                                                ? Theme.of(context).primaryColor
                                                : null,
                                            child: Text(
                                              'Login',
                                              style: GoogleFonts.nunitoSans(
                                                fontSize: 20,
                                                fontWeight: isLoginPage
                                                    ? FontWeight.w700
                                                    : FontWeight.w600,
                                                color: isLoginPage
                                                    ? Colors.white
                                                    : Color(0x9914C1FA),
                                              ),
                                            ),
                                          )),
                                          Expanded(
                                              child: MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            height: heightQuery * 0.0677,
                                            onPressed: () {
                                              setState(() {
                                                isLoginPage = false;
                                              });
                                            },
                                            color: isLoginPage == false
                                                ? Theme.of(context).primaryColor
                                                : null,
                                            child: Text(
                                              'SignUp',
                                              style: GoogleFonts.nunitoSans(
                                                fontSize: 20,
                                                fontWeight: !isLoginPage
                                                    ? FontWeight.w700
                                                    : FontWeight.w600,
                                                color: isLoginPage == false
                                                    ? Colors.white
                                                    : Color(0x9914C1FA),
                                              ),
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: heightQuery * 0.037,
                                    ),
                                    AnimatedSwitcher(
                                      duration: Duration(milliseconds: 500),
                                      child: currentWidget,
                                      switchInCurve: Curves.easeIn,
                                      switchOutCurve: Curves.easeInOut,
                                    ),
                                  ],
                                ),
                              )))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.yellow,
                        child: Image.asset(
                          'assets/images/onboarding1.png',
                          height: heightQuery * 0.1085,
                          width: sizeQuery.width * 0.21,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ],
              )))
            ],
          )),
    );
  }
}
