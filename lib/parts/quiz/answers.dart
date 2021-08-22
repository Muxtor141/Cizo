import 'package:flutter/material.dart';

class QuizAnswers extends StatefulWidget {
  QuizAnswers({Key? key}) : super(key: key);

  @override
  _QuizAnswersState createState() => _QuizAnswersState();
}

class _QuizAnswersState extends State<QuizAnswers> {
  Widget answerCard() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
            left: sizeQuery.width * 0.0666, right: sizeQuery.width * 0.0666),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Container(
          margin: EdgeInsets.only(
            top: heightQuery * 0.0307,
          ),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (x, index) {
                return Text(index.toString());
              }),
        ),
      ),
    );
  }
}
