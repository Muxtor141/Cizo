import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class CizoProgressIndicator extends StatefulWidget {
  CizoProgressIndicator({Key? key}) : super(key: key);

  @override
  _CizoProgressIndicatorState createState() => _CizoProgressIndicatorState();
}

class _CizoProgressIndicatorState extends State<CizoProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
   
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
                // padding: EdgeInsets.only(
                //     top: heightQuery * 0.0234,
                //     left: sizeQuery.width * 0.0506,
                //     right: sizeQuery.width * 0.0506,
                //     bottom: heightQuery * 0.0234),
                height: heightQuery * 0.0973,
                width: sizeQuery.width * 0.21,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 75, color: Color(0x339B9B9B))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Container(
                    width: sizeQuery.width * 0.1013,
                    height: heightQuery * 0.0505,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                ))),
      ),
    );
    
  }
}
