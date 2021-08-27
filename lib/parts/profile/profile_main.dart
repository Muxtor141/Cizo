import 'package:cizo/parts/profile/dialog.dart';
import 'package:cizo/parts/setup/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

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
            height: heightQuery * 0.1034,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: heightQuery * 0.178,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0x1A14C1FA),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(width: 6, color: Colors.white)),
                    height: heightQuery * 0.1478,
                    width: sizeQuery.width * 0.32,
                  ),
                  Container(
                    width: sizeQuery.width * 0.32,
                    child: Column(
                      children: [
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          height: heightQuery * 0.06157,
                          width: sizeQuery.width * 0.133,
                          child: Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.photo_camera)),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          SizedBox(
            height: heightQuery * 0.0307,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Robert Fodie',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0x1A14C1FA)),
                height: heightQuery * 0.0702,
                width: sizeQuery.width * 0.6053,
                child: Center(
                  child: Text('someemail@gmail.com',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor)),
                ),
              )
            ],
          ),
          SizedBox(
            height: heightQuery * 0.0554,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            padding: EdgeInsets.all(12),
            height: heightQuery * 0.0788,
            child: Row(
              children: [
                Container(
                    height: heightQuery * 0.0492,
                    width: sizeQuery.width * 0.1066,
                    decoration: BoxDecoration(
                        color: Color(0x3314C1FA),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Container(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                          'assets/icons/person.png',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )),
                SizedBox(
                  width: sizeQuery.width * 0.04,
                ),
                Text(
                  'Edit Profile',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff323438)),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "profileSetup",
                          arguments: ProfileArguments(false));
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )),
                SizedBox(
                  width: sizeQuery.width * 0.0373,
                )
              ],
            ),
          ),
          SizedBox(
            height: heightQuery * 0.0308,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            padding: EdgeInsets.all(12),
            height: heightQuery * 0.0788,
            child: Row(
              children: [
                Container(
                    height: heightQuery * 0.0492,
                    width: sizeQuery.width * 0.1066,
                    decoration: BoxDecoration(
                        color: Color(0x3314C1FA),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Container(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                          'assets/icons/lock.png',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )),
                SizedBox(
                  width: sizeQuery.width * 0.04,
                ),
                Text(
                  'Change Password',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff323438)),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )),
                SizedBox(
                  width: sizeQuery.width * 0.0373,
                )
              ],
            ),
          ),
          SizedBox(
            height: heightQuery * 0.0308,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            padding: EdgeInsets.all(12),
            height: heightQuery * 0.0788,
            child: Row(
              children: [
                Container(
                  height: heightQuery * 0.0492,
                  width: sizeQuery.width * 0.1066,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Container(
                      width: 24,
                      height: 24,
                      child: Image.asset('assets/icons/exit.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeQuery.width * 0.04,
                ),
                Text(
                  'Log out',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff323438)),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (c) {
                            return ProfileDialog();
                          });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )),
                SizedBox(
                  width: sizeQuery.width * 0.0373,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
