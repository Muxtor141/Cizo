import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSearch extends StatefulWidget {
  HomeSearch({Key? key}) : super(key: key);

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Container(
      height: heightQuery * 0.458,
      child: Column(
        children: [
          SizedBox(
            height: heightQuery * 0.0788,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: sizeQuery.width * 0.0666,
                  right: sizeQuery.width * 0.0666,
                ),
                height: heightQuery * 0.0615,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Wrap(
                    children: [
                      Icon(Icons.health_and_safety),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Hello, ',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0x99323438))),
                        TextSpan(
                            text: 'Robert!',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff323438))),
                      ]))
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: heightQuery * 0.037,
          ),
          Container(
            padding: EdgeInsets.only(
                left: sizeQuery.width * 0.0666,
                right: sizeQuery.width * 0.0666,
                top: heightQuery * 0.0307,
                bottom: heightQuery * 0.0307),
            width: sizeQuery.width * 0.866,
            height: heightQuery * 0.2807,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(35)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Find Quiz Code',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFAFAFA)),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightQuery * 0.0185,
                ),
                Text(
                  'Enter quiz code that given by teacher,and you can start gathering points',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFAFAFA)),
                ),
                SizedBox(
                  height: heightQuery * 0.037,
                ),
             
                    Container(height: heightQuery*0.0677,
                        child: TextField(cursorColor: Color(0xffF31629),
                      decoration: InputDecoration(fillColor: Colors.white,filled: true,prefixIcon: Icon(Icons.search_sharp),
                      enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.transparent)) ,
                              focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.transparent)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.transparent))),
                    )
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
