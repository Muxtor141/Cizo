import 'package:cizo/models/question_model.dart';
import 'package:cizo/parts/quiz/answers.dart';
import 'package:cizo/parts/quiz/question.dart';
import 'package:cizo/parts/quiz/timer.dart';
import 'package:cizo/services/solving/solving_ui_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizSolvingMain extends StatelessWidget {
  final String code;
  const QuizSolvingMain({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: MultiBlocProvider(providers: [
        BlocProvider<SelectAnswerCubit>(create: (x)=>SelectAnswerCubit())
      ],
        child: Column(
          children: [
            QuizTimer(),
            QuizQuestion(),
            QuizAnswers(),
          ],
        ),
      ),
    );
  }
}
