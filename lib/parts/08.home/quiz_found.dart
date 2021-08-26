import 'dart:async';
import 'dart:ui';

import 'package:cizo/components/progress_indicator.dart';
import 'package:cizo/models/question_model.dart';
import 'package:cizo/parts/quiz/quiz_main.dart';
import 'package:cizo/services/home/fetchdata_main.dart';
import 'package:cizo/services/solving/solving_controller_cubit.dart';
import 'package:cizo/services/solving/solving_events.dart';
import 'package:cizo/services/solving/solving_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizFound extends StatelessWidget {
  final String quizName;
  final String quizCode;
  final String quizCreator;
  final int quizTime;

  const QuizFound({
    Key? key,
    required this.quizCode,
    required this.quizCreator,
    required this.quizName,
    required this.quizTime
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: heightQuery,
        child: Column(
          children: [
            SizedBox(
              height: heightQuery * 0.0788,
            ),
            Row(
              children: [
                SizedBox(
                  width: sizeQuery.width * 0.0666,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/icons/arrow-left.png'),
                    ))
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
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
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
                  child: SingleChildScrollView(
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
                          padding: EdgeInsets.only(
                              left: sizeQuery.width * 0.08,
                              right: sizeQuery.width * 0.08),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0x1A14C1FA)),
                          height: heightQuery * 0.0702,
                          child: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text('$quizCode -$quizName',
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
                              color: Colors.white,
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
                              Text(quizCreator,
                                  style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color:
                                          Theme.of(context).primaryColorDark)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: heightQuery * 0.0554,
                        ),
                        BlocBuilder<FetchQuestionBLoc, List>(
                          builder: (blocContext, state) {
                   
                            return Container(
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
                                  onPressed: () {
                                    BuildContext c1 = context;
                                    showDialog(
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        builder: (c) {
                                          c1 = c;
                                          return CizoProgressIndicator();
                                        });
                                    Timer(Duration(milliseconds: 1500), () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (c) {
                                        return MultiBlocProvider(
                                            providers: [
                                              BlocProvider(
                                                create: (c) => SolvingBloc()
                                                  ..add(
                                                    UpdateIndex(quizCode),
                                                  ),
                                              ),
                                              BlocProvider(
                                                create: (c) =>
                                                    SolvingControllerCubit(),
                                              )
                                            ],
                                            child: QuizSolvingMain(
                                              quizTime: quizTime,
                                            ));
                                      }));
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
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
