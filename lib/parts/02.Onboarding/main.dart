import 'package:cizo/parts/02.Onboarding/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingMain extends StatefulWidget {
  OnboardingMain({Key? key}) : super(key: key);

  @override
  _OnboardingMainState createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  PageController _pageController = PageController();
  int currentPageIndex = 0;
  String firstText = "Thank you for downloading our app! Enjoy all ";
  String secondText = "of Cizo features directly in your hands!";
  String thirdText = "Welcome to Cizo!";

  List<Widget> _buildIndicator() {
    List<Widget> list = [];
    for (int e = 0; e < 3; e++) {
      list.add(
          e == currentPageIndex ? _dotIndicator(true) : _dotIndicator(false));
    }
    return list;
  }

  Widget _dotIndicator(bool state) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 9,
      margin: EdgeInsets.symmetric(horizontal: 7.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: state ? Theme.of(context).primaryColor : Color(0x66A9A9A9)),
      width: state ? 20 : 8,
    );
  }

  Map<String, dynamic> introMap = {
    "1.1": "Thank you for downloading our app! Enjoy all ",
    "1.2": "of Cizo features directly in your hands!",
    "1.3": "Welcome to Cizo!",
    "2.1": "Cizo is trusted by the teachers worldwide to ",
    "2.2": "maintain the student learning progress.",
    "2.3": "Trusted by Teachers",
    "3.1": "Gather all the poins as much as you can, be a ",
    "3.2": "superstar in your class with Cizo!",
    "3.3": "Get Ready, be a Superstar!",
  };
  void setText() {
    switch (currentPageIndex + 1) {
      case 1:
        firstText = introMap['1.1'];
        secondText = introMap['1.2'];
        thirdText = introMap['1.3'];

        break;
      case 2:
        firstText = introMap['2.1'];
        secondText = introMap['2.2'];
        thirdText = introMap['2.3'];
        break;
      case 3:
        firstText = introMap['3.1'];
        secondText = introMap['3.2'];
        thirdText = introMap['3.3'];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
              height: heightQuery * 0.473,
              child: PageView(
                onPageChanged: (int index) {
                  setState(() {
                    currentPageIndex = index;
                    setText();
                  });
                },
                controller: _pageController,
                children: [
                  OnboardingFirst(
                    pageIndex: 0,
                  ),
                  OnboardingFirst(
                    pageIndex: 1,
                  ),
                  OnboardingFirst(
                    pageIndex: 2,
                  )
                ],
              )),
          SizedBox(
            height: heightQuery * 0.0862,
          ),
          Expanded(
            child: Container(
              width: sizeQuery.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              padding: EdgeInsets.only(
                  left: sizeQuery.width * 0.066,
                  right: sizeQuery.width * 0.066),
              child: Column(
                children: [
                  SizedBox(
                    height: heightQuery * 0.043,
                  ),
                  AnimatedSwitcher(
                    duration: Duration(microseconds: 200),
                    child: Text(
                      thirdText,
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xff323438)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: sizeQuery.height * 0.0246,
                  ),
                  AnimatedSwitcher(
                    duration: Duration(microseconds: 200),
                    child: Text(
                      firstText,
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0x99323438),
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: Duration(microseconds: 200),
                    child: Text(
                      secondText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0x99323438),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightQuery * 0.0615,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicator(),
                  ),
                  SizedBox(
                    height: heightQuery * 0.037,
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColor,
                    height: heightQuery * 0.0714,
                    elevation: 0,
                    minWidth: sizeQuery.width * 0.868,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      currentPageIndex!=2?
                      _pageController.animateToPage( currentPageIndex + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear):Navigator.pushNamed(context, 'auth');
                    },
                    child: AnimatedSwitcher(duration: Duration(milliseconds: 100),
                      child: Text(
                        currentPageIndex==2?'Start the Journay':'Next',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
