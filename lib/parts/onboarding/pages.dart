import 'package:flutter/material.dart';

class OnboardingFirst extends StatelessWidget {
  final int pageIndex;
  const OnboardingFirst({Key? key, required this.pageIndex}) : super(key: key);

  List<Widget> widgets(Size sizeQuery, double heightQuery) {
    List<Widget> list = [
      Column(
        children: [
          SizedBox(
            height: heightQuery * 0.13,
          ),
          Container(
              height: heightQuery * 0.342,
              child: Stack(children: [
                Column(
                  children: [
                    SizedBox(
                      height: heightQuery * 0.086,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/onboarding.png",
                          height: heightQuery * 0.256,
                          width: sizeQuery.width * 0.866,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: heightQuery * 0.142,
                          width: 150,color: Colors.orange,
                   
                      child:FittedBox(
                        child: Image.asset(
                          "assets/images/onboarding1.png",
                       
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ])),
        ],
      ),
//ONBOARDING 2 SCREEN WIDGET START

      Column(
        children: [
          SizedBox(
            height: heightQuery * 0.098,
          ),
          Container(
           
              height: heightQuery * 0.3742,
              child: Stack(children: [
                Column(
                  children: [
                    SizedBox(
                      height: heightQuery * 0.118,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/onboarding.png",
                          height: heightQuery * 0.256,
                          width: sizeQuery.width * 0.866,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: heightQuery * 0.032,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.red,
                          height: heightQuery * 0.142,
                          width: sizeQuery.width * 0.485,
                          child: Image.asset(
                            "assets/images/onboarding2.png",
                            height: heightQuery * 0.142,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: sizeQuery.width * 0.611),
                        Container(
                          color: Colors.red,
                          width: sizeQuery.width * 0.1946,
                          height: heightQuery * 0.09,
                          child: Image.asset(
                            "assets/images/onboarding2.1.png",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ])),
        ],
      ),

      //ONBOARDING 3 PAGE START

      Column(
        children: [
          SizedBox(
            height: heightQuery * 0.13,
          ),
          Container( 
              height: heightQuery * 0.342,
              child: Stack(children: [
                Column(
                  children: [
                    SizedBox(
                      height: heightQuery * 0.086,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/onboarding.png",
                          height: heightQuery * 0.256,
                          width: sizeQuery.width * 0.866,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.red,
                      height: heightQuery * 0.142,
                      child: Image.asset(
                        "assets/images/onboarding3.png",
                        height: heightQuery * 0.142,
                      ),
                    ),
                  ],
                ),
              ])),
        ],
      )
    ];

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;

    return Container(
      child: widgets(sizeQuery, heightQuery)[pageIndex],
    );
  }
}
