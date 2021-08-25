import 'package:cizo/models/single_question_model.dart';
import 'package:cizo/services/solving/solving_events.dart';
import 'package:cizo/services/solving/solving_main.dart';
import 'package:cizo/services/solving/solving_ui_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizAnswers extends StatefulWidget {
  QuizAnswers({Key? key}) : super(key: key);

  @override
  _QuizAnswersState createState() => _QuizAnswersState();
}

class _QuizAnswersState extends State<QuizAnswers> {
  String rightAnswer = '';

  Widget answerCard(double widthQuery, double heightQuery, int orderIndex,
      String answer, int currentIndex, BuildContext cubit) {
    return GestureDetector(
      onTap: () {
        cubit.read<SelectAnswerCubit>().update(orderIndex);
        rightAnswer = answer;
      },
      child: Container(
        padding: EdgeInsets.only(
            left: widthQuery * 0.0666, right: widthQuery * 0.0666),
        height: heightQuery * 0.0862,
        width: widthQuery * 0.866,
        decoration: BoxDecoration(
            color: currentIndex == orderIndex
                ? Theme.of(context).primaryColor
                : Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              answer,
              style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: currentIndex == orderIndex
                      ? Colors.white
                      : Theme.of(context).primaryColorDark),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Expanded(
      child: BlocBuilder<SolvingBloc, SingleQuestionModel>(
        builder: (blocContext, blocState) {
        
          var answerList = [blocState.rightAnswer, ...blocState.wrongAnswers];

          return Container(
            padding: EdgeInsets.only(
                left: sizeQuery.width * 0.0666,
                right: sizeQuery.width * 0.0666),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: Offset(0, 7.0),
                    blurRadius: 75,
                    color: Color(0XFFC5C5C5).withOpacity(0.25)),
              ]),
              child: BlocBuilder<SelectAnswerCubit, int>(
                builder: (cubitContext, cubitState) {
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (x, index) {
                                return Container(
                                    margin: index == 0
                                        ? null
                                        : EdgeInsets.only(
                                            top: heightQuery * 0.0307),
                                    child: answerCard(
                                        sizeQuery.width,
                                        heightQuery,
                                        index + 1,
                                        answerList[index],
                                        cubitState,
                                        cubitContext));
                              }),
                        ),
                      ),
                      SizedBox(height: heightQuery * 0.04187),
                      Container(
                        height: heightQuery * 0.0702,
                        width: sizeQuery.width * 0.866,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: cubitState != 0
                                        ? Colors.transparent
                                        : Color(0X66323438),
                                    width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: cubitState != 0
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent),
                          onPressed: () {
                            if (cubitState != 0) {
                              cubitContext.read<SelectAnswerCubit>().update(0);
                              blocContext
                                  .read<SolvingBloc>()
                                  .add(NextQuestion());
                              if (rightAnswer == blocState.rightAnswer) {
                                print('CORRECT ANSWER');
                              } else {
                                print('WRONG ANSWER');
                              }
                            }

                            // setState(() {
                            //   buttonTest = !buttonTest;
                            // });
                          },
                          child: Text(
                            'Next',
                            style: GoogleFonts.nunitoSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: cubitState != 0
                                  ? Colors.white
                                  : Color(0xffA9A9A9),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightQuery * 0.07266,
                      )
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
