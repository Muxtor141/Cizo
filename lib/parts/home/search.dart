import 'dart:async';

import 'package:cizo/components/progress_indicator.dart';
import 'package:cizo/models/quizcard_model.dart';

import 'package:cizo/parts/home/quiz_found.dart';
import 'package:cizo/parts/home/quiz_not_found.dart';
import 'package:cizo/services/home/fetchdata_main.dart';

import 'package:cizo/services/home/main_events.dart';
import 'package:cizo/services/home/search_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSearch extends StatefulWidget {
  HomeSearch({Key? key}) : super(key: key);

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  bool isWriting = false;
  bool extended = false;

  TextEditingController _controller = TextEditingController();
  FocusNode _focus = FocusNode();

  void navigate(BuildContext blocContext, BuildContext context1) {
    blocContext.read<FetchDataBLoc>().add(UpdateCardList());
    BuildContext c1 = context1;
    showDialog(
        barrierColor: Colors.transparent,
        context: context1,
        builder: (c) {
          c1 = c;
          return CizoProgressIndicator();
        });
    QuizCardModel? card =
        blocContext.read<FetchDataBLoc>().getCard(_controller.text);
    Timer(Duration(milliseconds: 1000), () {
      Navigator.pop(c1);

      if (card != null) {
        Navigator.push(
          context1,
          MaterialPageRoute(builder: (c) {
            return MultiBlocProvider(
                providers: [
                  BlocProvider<FetchQuestionBLoc>(
                      create: (x) =>
                          FetchQuestionBLoc()..add(UpdateQuestionList())),
                ],
                child: QuizFound(isPublic: false,
                    quizTime: card.quizTime,
                    quizCode: card.quizCode.toString(),
                    quizCreator: card.creator,
                    quizName: card.quizName));
          }),
        );
      } else if (card == null) {
        Navigator.push(
          context1,
          MaterialPageRoute(builder: (c) {
            return QuizNotFound(quizName: _controller.text.toString());
          }),
        );
      }
    });
  }

  void onFocusChanged(BuildContext blocContext) {
    if (_focus.hasFocus) {
blocContext.read<SearchUICubit>().makWriting(true);
   
Timer(Duration(milliseconds: 250), () {
          blocContext.read<SearchUICubit>().makExtended(true);
      });

      // setState(() {
      //   isWriting = true;
      //   Timer(Duration(milliseconds: 200), () {
      //     extended = true;
      //   });
      // });
    }
    if (_focus.hasFocus == false) {
          blocContext.read<SearchUICubit>().makExtended(false);
Timer(Duration(milliseconds: 250), () {
         blocContext.read<SearchUICubit>().makWriting(false);
      });
      // setState(() {
        
      //   extended = false;
      //   Timer(Duration(milliseconds: 100), () {
      //     isWriting = false;
      //   });
      // });
    }
  }

  void onFocusChanged2(BuildContext blocContext) {
    blocContext.read<SearchUICubit>().makExtended(false);
Timer(Duration(milliseconds: 200), () {
         blocContext.read<SearchUICubit>().makWriting(false);
      });
    // setState(() {
    //   extended = false;
    //   Timer(Duration(milliseconds: 200), () {
    //     isWriting = false;
    //   });
    // });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _focus
  //     ..addListener(() {
  //       onFocusChanged();
  //     });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return BlocBuilder<SearchUICubit, List<bool>>(
      builder: (blocContext, blocState) {
         _focus
      ..addListener(() {
        onFocusChanged(blocContext);
      });
        isWriting = blocState[1];
        extended = blocState[0];
        return Column(
          children: [
            AnimatedContainer(
              duration: Duration(microseconds: 200),
              height: isWriting ? heightQuery * 0.58 : heightQuery * 0.46,
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
                  AnimatedContainer(
                    duration: Duration(microseconds: 200),
                    margin: EdgeInsets.only(
                      left: sizeQuery.width * 0.0666,
                      right: sizeQuery.width * 0.0666,
                    ),
                    height: isWriting ? heightQuery * 0.4 : heightQuery * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white),
                    child: BlocBuilder<FetchDataBLoc, List>(
                      builder: (blocContext, state) {
                        print('BUILD');
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: sizeQuery.width * 0.0666,
                                  right: sizeQuery.width * 0.0666,
                                  top: heightQuery * 0.0307,
                                  bottom: heightQuery * 0.0307),
                              width: sizeQuery.width * 0.866,
                              height: heightQuery * 0.28,
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
                                  Container(
                                      height: heightQuery * 0.0677,
                                      child: TextField(
                                        focusNode: _focus,
                                        controller: _controller,
                                        cursorColor: Color(0xffF31629),
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            suffixIcon: isWriting
                                                ? IconButton(
                                                    onPressed: () {
                                                      _controller.clear();
                                                      _focus.unfocus();
                                                      onFocusChanged2(blocContext);
                                                    },
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Colors.grey[400],
                                                    ),
                                                  )
                                                : null,
                                            prefixIcon: isWriting
                                                ? null
                                                : Icon(Icons.search_sharp),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.transparent))),
                                      )),
                                ],
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 200),
                              switchInCurve: Curves.easeIn,
                              switchOutCurve: Curves.easeInOut,
                              child: extended
                                  ? Wrap(
                                      direction: Axis.vertical,
                                      children: [
                                        SizedBox(
                                          height: heightQuery * 0.0246,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: sizeQuery.width * 0.7333,
                                              height: heightQuery * 0.0702,
                                              child: TextButton(
                                                  style: TextButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .primaryColor),
                                                  onPressed: () {
                                                    onFocusChanged2(blocContext);

                                                    navigate(
                                                        blocContext, context);
                                                  },
                                                  child: Center(
                                                    child: Text('Find Quiz',
                                                        style: GoogleFonts
                                                            .nunitoSans(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white,
                                                        )),
                                                  )),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  : SizedBox(),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
