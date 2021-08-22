import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Container(margin: EdgeInsets.only(bottom: heightQuery*0.0307),
      padding: EdgeInsets.only(
          left: sizeQuery.width * 0.0666, right: sizeQuery.width * 0.0666),
      child: Container(padding: EdgeInsets.all(25),
        width: sizeQuery.width * 0.866,
        height: heightQuery * 0.128,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(35)),
        child: Text(
          '1. Which organelle is found in a plant cell and NOT an animal cell?',
          style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Theme.of(context).primaryColorDark),
        ),
      ),
    );
  }
}
