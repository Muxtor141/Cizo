import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizAnswers extends StatefulWidget {
  QuizAnswers({Key? key}) : super(key: key);

  @override
  _QuizAnswersState createState() => _QuizAnswersState();
}

class _QuizAnswersState extends State<QuizAnswers> {
  int currentIndex = 0;
  bool buttonTest = false;

  Widget answerCard(double widthQuery, double heightQuery, int orderIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = orderIndex;
        });
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
              'Cell Wail',
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
      child: Container(
        padding: EdgeInsets.only(
            left: sizeQuery.width * 0.0666, right: sizeQuery.width * 0.0666),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: Offset(0, 7.0),
                blurRadius: 75,
                color: Color(0XFFC5C5C5).withOpacity(0.25)),
          ]),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (x, index) {
                        return Container(
                            margin: index == 0
                                ? null
                                : EdgeInsets.only(top: heightQuery * 0.0307),
                            child: answerCard(
                                sizeQuery.width, heightQuery, index + 1));
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
                            color: buttonTest == true
                                ? Colors.transparent
                                : Color(0X66323438),
                            width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: buttonTest == true
                          ? Theme.of(context).primaryColor
                          : Colors.transparent),
                  onPressed: () {
                    setState(() {
                      buttonTest = !buttonTest;
                    });
                  },
                  child: Text(
                    'Next',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color:
                          buttonTest == true ? Colors.white : Color(0xffA9A9A9),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightQuery * 0.07266,
              )
            ],
          ),
        ),
      ),
    );
  }
}
