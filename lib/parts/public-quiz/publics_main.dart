import 'package:cizo/components/public_quiz_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicMain extends StatefulWidget {
  PublicMain({Key? key}) : super(key: key);

  @override
  _PublicMainState createState() => _PublicMainState();
}

class _PublicMainState extends State<PublicMain> {
  bool isLoginPage = false;
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: sizeQuery.width * 0.0666,
          right: sizeQuery.width * 0.0666,
        ),
        child: Column(
          children: [
            SizedBox(
              height: heightQuery * 0.0862,
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              ],
            ),
            SizedBox(
              height: heightQuery * 0.0344,
            ),
            Row(
              children: [
                Text(
                  'Public Quiz',
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xff323438)),
                ),
              ],
            ),
            SizedBox(
              height: heightQuery * 0.0307,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              height: heightQuery * 0.0665,
              child: Row(
                children: [
                  Expanded(
                      child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    height: heightQuery * 0.0665,
                    onPressed: () {
                      setState(() {
                        isLoginPage = true;
                      });
                    },
                    color: isLoginPage ? Theme.of(context).primaryColor : null,
                    child: Text(
                      'All',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 20,
                        fontWeight:
                            isLoginPage ? FontWeight.w700 : FontWeight.w600,
                        color: isLoginPage ? Colors.white : Color(0x9914C1FA),
                      ),
                    ),
                  )),
                  Expanded(
                      child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    height: heightQuery * 0.0677,
                    onPressed: () {
                      setState(() {
                        isLoginPage = false;
                      });
                    },
                    color: isLoginPage == false
                        ? Theme.of(context).primaryColor
                        : null,
                    child: Text(
                      'Recent',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 20,
                        fontWeight:
                            !isLoginPage ? FontWeight.w700 : FontWeight.w600,
                        color: isLoginPage == false
                            ? Colors.white
                            : Color(0x9914C1FA),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: heightQuery * 0.0431,
            ),
           Expanded(
              child: ListView.builder(itemCount: 10,
                itemBuilder: (c, index) {
                return Container(margin: EdgeInsets.only(bottom: heightQuery*0.0307),
                  child: PublicQuizItem()) ;
              }),
            )
          ],
        ),
      ),
    );
  }
}
