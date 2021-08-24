import 'package:cizo/parts/08.home/public_quiz.dart';
import 'package:cizo/parts/08.home/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          HomeSearch(),
          Expanded(child: HomePublicQuiz(),),
        ],
      ),
    );
  }
}
