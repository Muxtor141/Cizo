import 'package:cizo/parts/08.home/home_main.dart';
import 'package:cizo/parts/leaderboard/leaderboard.dart';
import 'package:cizo/services/leaderboard/leaderboard_bloc.dart';
import 'package:cizo/services/leaderboard/leaderboard_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizResultScreen extends StatelessWidget {
  final int score;
  final place;

  const QuizResultScreen({Key? key, required this.place, required this.score})
      : super(key: key);

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
                    Text(score.toString(),
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
                BlocBuilder<LeaderBoardBloc, List>(
                  builder: (blocContext, blocState) {
                    var place =
                        blocContext.read<LeaderBoardBloc>().getPlace(score);
                    return Container(
                        child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'You got ',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context)
                                    .primaryColorDark
                                    .withOpacity(0.6))),
                        TextSpan(
                            text: '$score',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .primaryColorDark
                                    .withOpacity(0.8))),
                        TextSpan(
                            text: 'points and you are on the ',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context)
                                    .primaryColorDark
                                    .withOpacity(0.6))),
                        TextSpan(
                            text: place,
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .primaryColorDark
                                    .withOpacity(0.8)))
                      ]),
                    ));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('place on this quiz leaderboard, keep it up!',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .primaryColorDark
                                .withOpacity(0.6))),
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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) => MultiBlocProvider(providers: [
                              BlocProvider.value(
                                  value:
                                      BlocProvider.of<LeaderBoardBloc>(context)
                                        ..add(UpdateLeaderBoard()))
                            ], child: LeaderBoardMain()),
                          ),
                        );
                      },
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
                      onPressed: () {
                        // Navigator.popUntil(context, ModalRoute.withName(""));
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => HomeMain()),
                        //     (Route<dynamic> route) => false);
                      },
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
