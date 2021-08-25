import 'package:cizo/components/public_quiz_item.dart';
import 'package:cizo/models/public_card_model.dart';
import 'package:cizo/parts/public-quiz/publics_main.dart';
import 'package:cizo/services/home/fetchdata_main.dart';
import 'package:cizo/services/home/fetchdata_public.dart';
import 'package:cizo/services/home/main_events.dart';
import 'package:cizo/services/home/public_events.dart';
import 'package:cizo/services/public/ui_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePublicQuiz extends StatelessWidget {
  const HomePublicQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(
        left: sizeQuery.width * 0.0666,
        right: sizeQuery.width * 0.0666,
      ),
      child: BlocBuilder<FetchPublicBLoc, List<PublicCardModel>>(
        builder: (blocContext, state) {
          print("build QUIZ");
          return Column(
            children: [
              SizedBox(
                height: heightQuery * 0.043,
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'Public Quiz',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                   InkWell(onTap: (){
                     Navigator.of(context)
                              .push(MaterialPageRoute(builder: (x) {
                            return MultiBlocProvider(providers: [
                 
                                BlocProvider.value(value: BlocProvider.of<UpdateListCubit>(context)),
                               BlocProvider.value(value: BlocProvider.of<FetchDataBLoc>(context)),
                            ],child: PublicMain());
                          }));
                   },
                     child: Container(width: 26,height: 26,child: Image.asset('assets/icons/arrow-right.png'),)),
                  ],
                ),
              ),
              SizedBox(
                height: heightQuery * 0.037,
              ),
              Expanded(
                  child: state.isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: state.length,
                          itemBuilder: (x, index) {
                            return Container(
                                margin: EdgeInsets.only(
                                    bottom: heightQuery * 0.0308),
                                child: PublicQuizItem(
                                  quizCode: state[index].quizCode,
                                  quizName: state[index].quizName,
                                ));
                          })
                      : Container()),
            ],
          );
        },
      ),
    );
  }
}
