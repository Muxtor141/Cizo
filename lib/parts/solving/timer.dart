import 'package:cizo/models/single_question_model.dart';
import 'package:cizo/services/solving/solving_controller_cubit.dart';
import 'package:cizo/services/solving/solving_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizTimer extends StatefulWidget {
  final BuildContext blocContext;
  final bool solvingState;
  final int time;
  QuizTimer(
      {Key? key,
      required this.blocContext,
      required this.solvingState,
      required this.time})
      : super(key: key);

  @override
  _QuizTimerState createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  int _minuteValue = 0;
  int _secondsValue = 0;
  bool _paused = false;

  final Stream<int> _periodicMinuter =
      Stream.periodic(Duration(milliseconds: 1000), (i) => i);
  int _previousStraemValue = 0;

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    _minuteValue = widget.time;
    return Container(
      child: BlocBuilder<SolvingBloc, SingleQuestionModel>(
        builder: (blocContext, blocState) {
          return Column(
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
                          child: StreamBuilder(
                            stream: this._periodicMinuter,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.data != null &&
                                  snapshot.data != this._previousStraemValue) {
                                this._previousStraemValue = snapshot.data;
                                if (widget.solvingState) {
                                  if (_secondsValue == 0) {
                                    this._minuteValue--;
                                    this._secondsValue = 60;
                                  } else {
                                    this._secondsValue--;
                                  }
                                  if (_minuteValue == 0 && _secondsValue == 0) {
                                    blocContext
                                        .read<SolvingControllerCubit>()
                                        .finishSolving();
                                  }
                                }
                              }

                              return Container(
                                child: Text(
                                  widget.solvingState
                                      ? "$_minuteValue:$_secondsValue"
                                      : _minuteValue.toString(),
                                  style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: heightQuery * 0.0307,
              )
            ],
          );
        },
      ),
    );
  }
}
