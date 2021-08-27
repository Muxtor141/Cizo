import 'dart:async';


import 'package:cizo/parts/auth/signup_part.dart';
import 'package:cizo/services/auth/auth_bloc.dart';
import 'package:cizo/services/auth/auth_cubits.dart';
import 'package:cizo/services/auth/signup_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_part.dart';

class AuthMain extends StatefulWidget {
  AuthMain({Key? key}) : super(key: key);

  @override
  _AuthMainState createState() => _AuthMainState();
}

class _AuthMainState extends State<AuthMain> {
 
  bool isLoginPage = true;
  bool isExtended = true;

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;

 Firebase.initializeApp();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        child: Column(
                          children: [
                            SizedBox(
                              height: heightQuery * 0.0812,
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Color(0x1A14C1FA),
                                  borderRadius: BorderRadius.circular(20)),
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
                                      Timer(Duration(milliseconds: 400), () {
                                        setState(() {
                                          isExtended = true;
                                        });
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
                                      Timer(Duration(milliseconds: 400), () {
                                        setState(() {
                                          isExtended = false;
                                        });
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
                              child: BlocBuilder<AuthBloc, bool>(
                                builder: (c, state) {
                                  return isExtended
                                      ? AuthLogin(
                                          blocContext: c,
                                          blocState: state,
                                        )
                                      : AuthSignUp(
                                          blocContext: c,
                                          blocState: state,
                                        );
                                },
                              ),
                              switchInCurve: Curves.easeIn,
                              switchOutCurve: Curves.easeInOut,
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
