import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSetup extends StatelessWidget {
  const ProfileSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          top: false,
          child: Column(
            children: [
              SizedBox(
                height: heightQuery * 0.096,
              ),
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
                              height: heightQuery * 0.1035,
                            ),
                            Row(
                              children: [
                               Image.asset('assets/icons/arrow-left.png',width: 28,height: 28,),
                                SizedBox(
                                  width: sizeQuery.width * 0.059,
                                ),
                                Text(
                                  'Setting Up Your Profile',
                                  style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Color(0xff323438)),
                                )
                              ],
                            ),
                            SizedBox(height: heightQuery * 0.068),
                            Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(40)),
                              height: heightQuery * 0.1724,
                              width: sizeQuery.width * 0.373,
                              child: Center(
                                child: Container(width: 45,height: 45,
                                  child: Image.asset('assets/icons/camera.png',)),
                              ),
                            ),
                            SizedBox(
                              height: heightQuery * 0.0307,
                            ),
                            Text(
                              'Add Profile Picture',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              height: heightQuery * 0.048,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Region',
                                  style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Color(0xCC323438)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: heightQuery * 0.0246,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: sizeQuery.width * 0.0373,
                                  right: sizeQuery.width * 0.0666),
                              child: Row(
                                children: [
                                  Icon(Icons.circle),
                                  SizedBox(
                                    width: sizeQuery.width * 0.0533,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Indonesia',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff323438))),
                                    TextSpan(
                                        text: ' +998',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[400]))
                                  ])),
                                  Spacer(),
                                  Image.asset('assets/icons/arrow-right.png',width: 28,height: 28,)
                                ],
                              ),
                              height: heightQuery * 0.0862,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x33C5C5C5),
                                        offset: Offset(0, 10),
                                        blurRadius: 77)
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: heightQuery * 0.0875,
                            ),
                            Container(
                              height: heightQuery * 0.0715,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Color(0x66323438), width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                  onPressed: () {},
                                  child: Center(
                                    child: Text(
                                      "Confirm",
                                      style: GoogleFonts.nunitoSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: sizeQuery.width * 0.067,
                      ),
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
