import 'package:cizo/components/public_quiz_item.dart';
import 'package:cizo/components/public_quiz_time.dart';
import 'package:cizo/services/home/fetchdata_public.dart';
import 'package:cizo/services/public/ui_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicMain extends StatefulWidget {
  PublicMain({Key? key}) : super(key: key);

  @override
  _PublicMainState createState() => _PublicMainState();
}

class _PublicMainState extends State<PublicMain> {
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<UpdateListCubit, bool>(
        builder: (cubitContext, state) {
          print("public build");
          bool isAll = state;

          Widget list(List<dynamic> blocState) {
            return isAll
                ? ListView.builder(
                    itemCount: blocState.length,
                    itemBuilder: (c, index) {
                      return Container(
                          margin: EdgeInsets.only(bottom: heightQuery * 0.0307),
                          child: PublicQuizItem(
                              quizCode: blocState[index].quizCode,
                              quizName: blocState[index].quizName));
                    })
                : ListView.builder(
                    itemCount: blocState.length,
                    itemBuilder: (c, index) {
                      return Container(
                          margin: EdgeInsets.only(bottom: heightQuery * 0.0307),
                          child: PublicQuizTimeItem(
                            quizCode: blocState[index].quizCode,
                            quizName: blocState[index].quizName,
                            quizTime: index.toString(),
                          ));
                    });
          }

          return Container(
            padding: EdgeInsets.only(
              left: sizeQuery.width * 0.0666,
              right: sizeQuery.width * 0.0666,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: heightQuery * 0.0862,
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 28,
                          height: 28,
                          child: Image.asset('assets/icons/arrow-left.png'),
                        )),
                  ],
                ),
                SizedBox(
                  height: heightQuery * 0.0344,
                ),
                Row(
                  children: [
                    Text(
                      'Public Quiz',
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xff323438)),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightQuery * 0.0307,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: heightQuery * 0.0665,
                  child: Row(
                    children: [
                      Expanded(
                          child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        height: heightQuery * 0.0665,
                        onPressed: () {
                          cubitContext.read<UpdateListCubit>().makeAll();
                        },
                        color: isAll ? Theme.of(context).primaryColor : null,
                        child: Text(
                          'All',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 20,
                            fontWeight:
                                isAll ? FontWeight.w700 : FontWeight.w600,
                            color: isAll ? Colors.white : Color(0x9914C1FA),
                          ),
                        ),
                      )),
                      Expanded(
                          child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        height: heightQuery * 0.0677,
                        onPressed: () {
                          cubitContext.read<UpdateListCubit>().makeRecent();
                        },
                        color: isAll == false
                            ? Theme.of(context).primaryColor
                            : null,
                        child: Text(
                          'Recent',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 20,
                            fontWeight:
                                !isAll ? FontWeight.w700 : FontWeight.w600,
                            color: isAll == false
                                ? Colors.white
                                : Color(0x9914C1FA),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: heightQuery * 0.0431,
                ),
                Expanded(
                  child: BlocBuilder<FetchPublicBLoc, List>(
                    builder: (blocContext, blocState) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 1000),
                        switchInCurve: Curves.bounceIn,
                        switchOutCurve: Curves.bounceOut,
                        child: list(blocState),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
