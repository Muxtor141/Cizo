import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: heightQuery * 0.5381,
        width: sizeQuery.width * 0.9666,
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: heightQuery * 0.0615,
                  ),
                  Container(
                    height: heightQuery * 0.4766,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Column(
                      children: [
                        SizedBox(
                          height: heightQuery * 0.09234,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Are you sure?',
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: Color(0xff323438)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heightQuery * 0.0246,
                        ),
                        Text(
                          'Do you still want to logout? But you ',
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0x99323438),
                          ),
                        ),
                        Text(
                          'can easily login to Cizo later.',
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0x99323438),
                          ),
                        ),
                        SizedBox(
                          height: heightQuery * 0.0431,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: sizeQuery.width * 0.0666,
                                    right: sizeQuery.width * 0.0666),
                                child: MaterialButton(
                                  elevation: 0,
                                  color: Theme.of(context).primaryColor,
                                  height: heightQuery * 0.0702,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    'Cancel',
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heightQuery * 0.0307,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: sizeQuery.width * 0.0666,
                                    right: sizeQuery.width * 0.0666),
                                child: MaterialButton(
                                  elevation: 0,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  height: heightQuery * 0.0702,
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    'Logout',
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: heightQuery * 0.1231,
                  width: sizeQuery.width * 0.2666,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x33C5C5C5),
                            offset: Offset(0, 10),
                            blurRadius: 77)
                      ],
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  child: Center(
                    child: Icon(Icons.circle_notifications),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
