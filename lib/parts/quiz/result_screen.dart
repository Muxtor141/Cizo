import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: heightQuery * 0.085,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'THU76X - Biologi Quiz IX',
                style: GoogleFonts.nunitoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: heightQuery * 0.04187,
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
            height: heightQuery * 0.037,
          ),
          Row(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.only(
                    left: sizeQuery.width * 0.08,
                    right: sizeQuery.width * 0.03),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: heightQuery * 0.0751,
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: sizeQuery.width * 0.016,
                    ),
                    Text('26752',
                        style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColorDark)),
                    SizedBox(
                      width: sizeQuery.width * 0.08,
                    )
                  ],
                ),
              ),
              Spacer()
            ],
          ),
          SizedBox(
            height: heightQuery * 0.04926,
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
                      'Congratulations!',
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
                    child: RichText(
                  text: TextSpan(
                    children: [
                    TextSpan(
                        text: 'You got ',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColorDark.withOpacity(0.6))),
                             TextSpan(
                        text: '2600 ',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorDark.withOpacity(0.8))),
                             TextSpan(
                        text: 'points and you are on the ',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColorDark.withOpacity(0.6))),
                             TextSpan(
                        text: '6th',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorDark.withOpacity(0.8)))
                  ]),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('place on this quiz leaderboard, keep it up!',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColorDark.withOpacity(0.6))),
                  ],
                ),
                SizedBox(
                  height: heightQuery * 0.0616,
                ),
                Container(
                  height: heightQuery * 0.0715,
                  child: MaterialButton(
                      color: Theme.of(context).primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "View LeaderBoard",
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      )),
                ),
                SizedBox(
                  height: heightQuery * 0.037,
                ),
                Container(
                  height: heightQuery * 0.0715,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: () {},
                      child: Center(
                        child: Text("Back to Home",
                            style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Theme.of(context).primaryColorDark)),
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
