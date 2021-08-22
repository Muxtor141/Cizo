import 'dart:ui';

import 'package:flutter/material.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        height: heightQuery * 0.1527,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: heightQuery * 0.0185,
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(
                      top: heightQuery * 0.025,
                      left: sizeQuery.width * 0.16,
                      right: sizeQuery.width * 0.16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Row(
                    children: [
                      Container(
                          child: IconButton(
                              onPressed: () {
                                showDialog(
                                    barrierColor: Colors.transparent,
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (x) {
                                      return AlertDialog(
                                        elevation: 0,
                                        backgroundColor: Colors.transparent,
                                        insetPadding: EdgeInsets.only(top: heightQuery*0.44),
                                        content: Container(
                                          decoration: BoxDecoration(
                                            
                                              image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image: AssetImage(
                                                    'assets/images/base.png',
                                                    
                                                  ))),
                                          height: heightQuery * 0.1675,
                                          width: sizeQuery.width * 0.866,
                                        ),
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.home,
                                size: 35,
                              ))),
                      Spacer(),
                      Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.person,
                                size: 35,
                              ))),
                    ],
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(23)),
                  height: heightQuery * 0.0813,
                  width: sizeQuery.width * 0.176,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
