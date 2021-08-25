import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizNotFound extends StatelessWidget {
  final String quizName;

  const QuizNotFound({Key? key,required this.quizName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: heightQuery * 0.0788,
          ),
          Row(
            children: [
              SizedBox(
                width: sizeQuery.width * 0.0666,
              ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/icons/arrow-left.png'),
                  )),
            ],
          ),
          SizedBox(
            height: heightQuery * 0.0714,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: heightQuery * 0.1871,
                width: sizeQuery.width * 0.3653,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),
          SizedBox(
            height: heightQuery * 0.1305,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(
              left: sizeQuery.width * 0.0666,
              right: sizeQuery.width * 0.0666,
            ),
            width: sizeQuery.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child:SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: heightQuery * 0.0431,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ooops,We Can\'t Find That!',
                        style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Theme.of(context).primaryColorDark),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightQuery * 0.037,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0x1A14C1FA)),
                    height: heightQuery * 0.0702,
                    width: sizeQuery.width * 0.6053,
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text('$quizName ',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightQuery * 0.0554,
                  ),
                  Container(
                    height: heightQuery * 0.0715,
                    child: MaterialButton(
                        color: Theme.of(context).primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            "Search Another Code21",
                            style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: heightQuery * 0.037,
                  ),
                  Container(
                    height: heightQuery * 0.0715,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {},
                        child: Center(
                          child: Text("Back to Home",
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColorDark)),
                        )),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
