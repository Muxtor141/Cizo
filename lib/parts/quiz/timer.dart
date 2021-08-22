import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizTimer extends StatefulWidget {
  QuizTimer({Key? key}) : super(key: key);

  @override
  _QuizTimerState createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: heightQuery * 0.0862,
          ),
          Container(
              padding: EdgeInsets.only(
                  left: sizeQuery.width * 0.0666,
                  right: sizeQuery.width * 0.0666),
              child: Row(
                children: [
                  Text(
                    'THU762X - Biology Quiz IX',
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(
                        left: sizeQuery.width * 0.065,
                        right: sizeQuery.width * 0.065,
                        top: heightQuery * 0.0123,
                        bottom: heightQuery * 0.0123),
                    height: heightQuery * 0.0542,
                    width: sizeQuery.width * 0.232,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(
                        '56:23',
                        style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                 
                ],
              )),
               SizedBox(height: heightQuery*0.0307,)
        ],
      ),
    );
  }
}
