import 'package:cizo/models/leader_model.dart';
import 'package:cizo/services/leaderboard/leaderboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardTop extends StatelessWidget {
  const LeaderboardTop({Key? key}) : super(key: key);

  Widget _card(
      Size sizeQuery, double heightQuery, int place, BuildContext blocContext) {
    LeaderModel model =
        blocContext.read<LeaderBoardBloc>().getSpecificLeader(place);
  

    return Container(
      margin: EdgeInsets.only(bottom: heightQuery * 0.02463),
      height: heightQuery * 0.1244,
      child: Stack(children: [
        Container(
          padding: EdgeInsets.only(
              left: sizeQuery.width * 0.048, right: sizeQuery.width * 0.06666),
          height: heightQuery * 0.101,
          width: sizeQuery.width * 0.866,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Row(
            children: [
              Container(
                width: sizeQuery.width * 0.1333,
                height: heightQuery * 0.06157,
                decoration: BoxDecoration(
                    color: Color(0xff14C1FA),
                    borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(
                width: sizeQuery.width * 0.04266,
              ),
              Text(
                model.leaderName,
                style: GoogleFonts.nunitoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff323438)),
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: heightQuery * 0.03571,
            ),
            Container(
              margin: EdgeInsets.only(left: sizeQuery.width * 0.632),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  Container(
                    width: sizeQuery.width * 0.168,
                    height: heightQuery * 0.03448,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFFB72B)),
                    child: Center(
                      child: Text(
                        model.leaderScore.toString(),
                        style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: heightQuery * 0.05418,
                    width: sizeQuery.width * 0.1173,
                    child: Image.asset(
                        'assets/images/medal${place.toString()}.png'),
                  )
                ],
              ),
            )
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xff14C1FA),
      height: heightQuery * 0.5444,
      child:
          // SizedBox(
          //   height: heightQuery * 0.0911,
          // ),
          // 35 px height

          BlocBuilder<LeaderBoardBloc, List>(
        builder: (blocContext, blocState) {
          return Column(
            children: [
              SizedBox(
                height: heightQuery * 0.0911,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _card(sizeQuery, heightQuery, 1, blocContext),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _card(sizeQuery, heightQuery, 2, blocContext),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _card(sizeQuery, heightQuery, 3, blocContext),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
