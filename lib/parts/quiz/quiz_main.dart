import 'package:cizo/parts/quiz/answers.dart';
import 'package:cizo/parts/quiz/question.dart';
import 'package:cizo/parts/quiz/timer.dart';
import 'package:flutter/material.dart';

class QuizSolvingMain extends StatelessWidget {
  const QuizSolvingMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Theme.of(context).primaryColor,
      body:Column(children: [
        QuizTimer(),
        QuizQuestion(),
        QuizAnswers(),
      ],),
    );
  }
}