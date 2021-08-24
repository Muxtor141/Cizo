import 'package:cizo/components/public_quiz_item.dart';
import 'package:flutter/material.dart';
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
      child: Column(
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
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 25,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: heightQuery * 0.037,
          ),
          Expanded(child: ListView.builder(padding:EdgeInsets.zero,
            itemCount: 6,
            itemBuilder: (x, index) {
            return Container(margin: EdgeInsets.only(bottom: heightQuery*0.0308),
              child: PublicQuizItem());
          }))
        ],
      ),
    );
  }
}
