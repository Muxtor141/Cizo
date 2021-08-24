import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicQuizItem extends StatelessWidget {
  const PublicQuizItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(20),
      height: heightQuery * 0.1355,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(25)),
            height: heightQuery * 0.0862,
            width: sizeQuery.width * 0.1866,
            child: Center(
              child: Container(width: 40,height: 40,
                child: Image.asset('assets/icons/illustro1.png')),
            ),
          ),
          SizedBox(
            width: sizeQuery.width * 0.0533,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
         
                  Text(
                    'Automotive XII',
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xff323438)),
                  ),
              
              SizedBox(height: heightQuery*0.01,),
         
                    Text('YH012Y',style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0x99323438)),),
                
            ],
          )
        ],
      ),
    );
  }
}
