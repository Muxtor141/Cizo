import 'package:cizo/models/leader_model.dart';
import 'package:cizo/parts/08.home/home_main.dart';
import 'package:cizo/services/home/fetchdata_main.dart';
import 'package:cizo/services/home/fetchdata_public.dart';
import 'package:cizo/services/home/public_events.dart';
import 'package:cizo/services/leaderboard/leaderboard_bloc.dart';
import 'package:cizo/services/onboarding/onboarding_bloc.dart';
import 'package:cizo/services/public/ui_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardLow extends StatelessWidget {
  const LeaderboardLow({Key? key}) : super(key: key);
  Widget _card(
      Size sizeQuery, double heightQuery, int index, LeaderModel model) {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: sizeQuery.width * 0.0666,
        ),
        Text(index.toString(),
            style: GoogleFonts.nunitoSans(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff14C1FA),
            )),
        SizedBox(
          width: sizeQuery.width * 0.0666,
        ),
        Container(
          width: sizeQuery.width * 0.768,
          height: heightQuery * 0.0862,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: Offset(0, 10.0),
                blurRadius: 77.87,
                color: Color(0XFFC5C5C5).withOpacity(0.2))
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.only(
              left: sizeQuery.width * 0.03733,
              right: sizeQuery.width * 0.06133),
          child: Row(
            children: [
              Container(
                height: heightQuery * 0.05172,
                width: sizeQuery.width * 0.112,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(
                width: sizeQuery.width * 0.04,
              ),
              Text(
                model.leaderName,
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xff323438),
                ),
              ),
              Spacer(),
              Text(
                model.leaderScore.toString(),
                style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFB72B)),
              )
            ],
          ),
        ),
        SizedBox(
          width: sizeQuery.width * 0.0666,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Expanded(
        child: Container(
      width: sizeQuery.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: BlocBuilder<LeaderBoardBloc, List>(
        builder: (blocContext, blocState) {
          List<LeaderModel> lowRankedLeaders =
              blocContext.read<LeaderBoardBloc>().getSortedLeaders();
          return Column(
            children: [
              SizedBox(
                height: heightQuery * 0.0431,
              ),
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: lowRankedLeaders.length,
                        itemBuilder: (c, index) {
                          return Container(
                              margin: EdgeInsets.only(
                                  bottom: heightQuery * 0.03078),
                              child: _card(sizeQuery, heightQuery, index + 4,
                                  lowRankedLeaders[index]));
                        }),
                    Column(
                      children: [
                        SizedBox(
                          height: heightQuery * 0.3128,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: heightQuery * 0.0702,
                              width: sizeQuery.width * 0.866,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  onPressed: () {
   Navigator.pushNamedAndRemoveUntil(context, "/main", (r) => false);

                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (c) {
                                    //   return MultiBlocProvider(
                                    //     providers: [
                                    //       BlocProvider<OnboardingPagingBloc>(
                                    //           create: (c) =>
                                    //               OnboardingPagingBloc()),
                                    //       BlocProvider<UpdateListCubit>(
                                    //           create: (c) => UpdateListCubit()),
                                    //       BlocProvider<FetchPublicBLoc>(
                                    //           create: (c) => FetchPublicBLoc()
                                    //             ..add(UpdatePublicCardList())),
                                    //       BlocProvider<FetchDataBLoc>(
                                    //           create: (c) => FetchDataBLoc()),
                                    //     ],
                                    //     child: HomeMain(),
                                    //   );
                                    // }),);
                                  },
                                  child: Text(
                                    'Back To Home',
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    ));
  }
}
