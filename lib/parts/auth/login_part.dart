
import 'package:cizo/parts/auth/textfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthLogin extends StatelessWidget {
    final BuildContext blocContext;
  final bool blocState;
  AuthLogin({Key? key,
  required this.blocContext,required this.blocState}) : super(key: key);

  TextEditingController _cName = TextEditingController();
  TextEditingController _cMail = TextEditingController();
  TextEditingController _cPassword = TextEditingController();

  final _kName = GlobalKey<FormState>();
  final _kMail = GlobalKey<FormState>();
  final _kPassword = GlobalKey<FormState>();

  static TextStyle _style = GoogleFonts.nunitoSans(
      fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xCC323438));

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    final topSpace = SizedBox(
      height: heightQuery * 0.0185,
    );
    final botSpace = SizedBox(
      height: heightQuery * 0.023,
    );
    final _init = Firebase.initializeApp();
    return FutureBuilder(
      future: _init,
      builder: (firebaseContext, snapshot) {
        Widget body = Column(
          children: [
            Container(
                margin: EdgeInsets.only(),
                width: sizeQuery.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: heightQuery * 0.037,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'E-Mail Adress',
                          style: _style,
                        ),
                      ],
                    ),
                    topSpace,
                    AuthTextField(
                        isLogin: true,
                        controller: _cMail,
                        formKey: _kMail,
                        fieldIndex: 1),
                    botSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Password', style: _style),
                      ],
                    ),
                    topSpace,
                    AuthTextField(
                        isLogin: true,
                        controller: _cPassword,
                        formKey: _kPassword,
                        fieldIndex: 2),
                    SizedBox(
                      height: heightQuery * 0.068,
                    ),
                    Container(
                      height: heightQuery * 0.0715,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0x66323438), width: 2),
                                borderRadius: BorderRadius.circular(20),
                              )),
                          onPressed: () {
                            _kName.currentState!.validate();
                          },
                          child: Center(
                            child: Text(
                              "Login",
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          )),
                    )
                  ],
                )))
          ],
        );
        if (snapshot.hasError) {
          return AbsorbPointer(child: body,absorbing: false,);
        } else if (snapshot.hasData) {
          return body;
        } else {
          return AbsorbPointer(child: body,absorbing: false,);
        }
      },
    );
  }
}
