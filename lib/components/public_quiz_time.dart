import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicQuizTimeItem extends StatelessWidget {
  final String quizName;
  final String quizCode;
  final String quizTime;
  const PublicQuizTimeItem({Key? key,required this.quizCode,required this.quizName,required this.quizTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(20),
      height: heightQuery * 0.2143,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25)),
                height: heightQuery * 0.0862,
                width: sizeQuery.width * 0.1866,
                child: Center(
                  child: Container(
                      width: 40,
                      height: 40,
                      child: Image.asset('assets/icons/illustro1.png')),
                ),
              ),
              SizedBox(
                width: sizeQuery.width * 0.0533,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quizName,
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xff323438)),
                  ),
                  SizedBox(
                    height: heightQuery * 0.01,
                  ),
                  Text(
                    quizCode.toString(),
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0x99323438)),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: heightQuery * 0.02463,
          ),
          Row(
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                height: heightQuery * 0.05418,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'Posted $quizTime Minutes ago',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
