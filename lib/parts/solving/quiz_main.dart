import 'package:cizo/parts/solving/answers.dart';
import 'package:cizo/parts/solving/question.dart';
import 'package:cizo/parts/solving/timer.dart';
import 'package:cizo/services/leaderboard/leaderboard_bloc.dart';
import 'package:cizo/services/leaderboard/leaderboard_events.dart';
import 'package:cizo/services/solving/solving_controller_cubit.dart';
import 'package:cizo/services/solving/solving_ui_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizSolvingMain extends StatelessWidget {
  final int quizTime;
  QuizSolvingMain({Key? key, required this.quizTime}) : super(key: key);

  bool isExtended = false;

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;




    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (c) => LeaderBoardBloc()..add(UpdateLeaderBoard())),
          BlocProvider<SelectAnswerCubit>(create: (x) => SelectAnswerCubit())
        ],
        child: BlocBuilder<SolvingControllerCubit, bool>(
          builder: (blocContext, blocState) {


            if (blocState) {
              isExtended = true;
            } else {
         
            }
            return Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  height: blocState == false ? 300 : 0,
                ),
                QuizTimer(time: 1,
                  blocContext: blocContext,
                  solvingState: blocState,
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(
                      bottom: blocState ? heightQuery * 0.0307 : 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(blocState ? 35 : 15)),
                  height:
                      blocState ? heightQuery * 0.128 : heightQuery * 0.0715,
                  width: blocState
                      ? sizeQuery.width * 0.866
                      : sizeQuery.width * 0.72,
                  duration: Duration(milliseconds: 1000),
                  child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 1000),
                      child: isExtended
                          ? Container(child: QuizQuestion())
                          : Container(
                              height: heightQuery * 0.0715,
                              width: sizeQuery.width * 0.72,
                              child: TextButton(
                                child: Text(
                                  "Start Quiz",
                                  style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor),
                                ),
                                onPressed: () {
                                  blocContext
                                      .read<SolvingControllerCubit>()
                                      .startSolving();
                                },
                              ),
                            )),
                ),
                Expanded(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    padding: EdgeInsets.only(
                        left: sizeQuery.width * 0.0666,
                        right: sizeQuery.width * 0.0666),
                    decoration: BoxDecoration(
                      color: blocState == false
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 1000),
                      child: isExtended ? QuizAnswers(blocState: blocState,) : Container(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
