import 'dart:ui';

import 'package:cizo/components/progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizFound extends StatelessWidget {
  const QuizFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: heightQuery * 0.0788,
          ),
          Row(
            children: [
              SizedBox(
                width: sizeQuery.width * 0.0666,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            ],
          ),
          SizedBox(
            height: heightQuery * 0.037,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: heightQuery * 0.1871,
                width: sizeQuery.width * 0.3653,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),
          SizedBox(
            height: heightQuery * 0.096,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(
              left: sizeQuery.width * 0.0666,
              right: sizeQuery.width * 0.0666,
            ),
            width: sizeQuery.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: [
                SizedBox(
                  height: heightQuery * 0.0431,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz Found',
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Theme.of(context).primaryColorDark),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightQuery * 0.037,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0x1A14C1FA)),
                  height: heightQuery * 0.0702,
                  width: sizeQuery.width * 0.6053,
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text('THU76KI -Biology Quiz IX',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                ),
                SizedBox(
                  height: heightQuery * 0.0431,
                ),
                Row(
                  children: [
                    Text(
                      'Created By',
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Theme.of(context)
                              .primaryColorDark
                              .withOpacity(0.8)),
                    )
                  ],
                ),
                SizedBox(
                  height: heightQuery * 0.0246,
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  height: heightQuery * 0.0862,
                  width: sizeQuery.width * 0.866,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x33C5C5C5),
                            offset: Offset(0, 10),
                            blurRadius: 77)
                      ],
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.yellow),
                        height: heightQuery * 0.0517,
                        width: sizeQuery.width * 0.112,
                      ),
                      SizedBox(
                        width: sizeQuery.width * 0.0533,
                      ),
                      Text('Alley Christie',
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Theme.of(context).primaryColorDark)),
                    ],
                  ),
                ),
                SizedBox(
                  height: heightQuery * 0.0554,
                ),
                Container(
                  height: heightQuery * 0.0715,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Color(0x66323438), width: 2),
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: () {
                        showDialog(
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (c) {
                              return CizoProgressIndicator();
                              
                            });
                           

                      },
                      child: Center(
                        child: Text(
                          "Enter Quiz",
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
    );
  }
}
