import 'package:cizo/models/single_question_model.dart';
import 'package:cizo/services/solving/solving_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return BlocBuilder<SolvingBloc,SingleQuestionModel>(
      builder: (blocContext, blocState) {
        return Container(
       
        padding: EdgeInsets.only(
            left: sizeQuery.width * 0.0666, right: sizeQuery.width * 0.0666),
        child: Container(
          padding: EdgeInsets.all(25),
          width: sizeQuery.width * 0.866,
      
          
          child: Text(
            '1.${blocState.question}',
            style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Theme.of(context).primaryColorDark),
          ),
        ),
      );
      },
 
    );
  }
}
