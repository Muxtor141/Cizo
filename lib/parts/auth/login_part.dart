import 'dart:async';

import 'package:cizo/components/progress_indicator.dart';
import 'package:cizo/parts/auth/textfield.dart';
import 'package:cizo/parts/setup/main.dart';
import 'package:cizo/services/auth/auth_bloc.dart';
import 'package:cizo/services/auth/signup_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthLogin extends StatefulWidget {
  final BuildContext blocContext;
  final bool blocState;
  AuthLogin({Key? key, required this.blocContext, required this.blocState})
      : super(key: key);

  @override
  _AuthLoginState createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  TextEditingController _cMail = TextEditingController();
  TextEditingController _cPassword = TextEditingController();

  static TextStyle _style = GoogleFonts.nunitoSans(
      fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xCC323438));



  final _kMail = GlobalKey<FormState>();

  final _kPassword = GlobalKey<FormState>();


  bool changeLogin(){
     List<GlobalKey<FormState>> list = [_kMail,_kPassword];
    var validatesIndex = 0;
    for (var e in list) {
      if (e.currentState!.validate() == true) {
        validatesIndex++;
      } 
    }

    if (validatesIndex == 2) {
 
      return true;
    } else {
     
      return false;
    }
  }

  void registrate(BuildContext context1) {
    BuildContext c1 = context1;
    showDialog(
        barrierColor: Colors.transparent,
        context: context1,
        builder: (c) {
          c1 = c;
          return CizoProgressIndicator();
        });

    Timer(Duration(milliseconds: 2000), () {
      Navigator.pop(c1);
      widget.blocContext
          .read<AuthBloc>()
          .add(SignIn(_cMail.text, _cPassword.text));
    });
  }

  @override
  void dispose() {
    _cMail.dispose();
    _cMail.dispose();
    // TODO: implement dispose

    super.dispose();
  }

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

    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else  {
        Navigator.of(context)
            .pushNamed("profileSetup", arguments: ProfileArguments(true));
        print('User is signed in!');
      }
    });
    print("BUILD");

    return Column(
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
                            side:
                                BorderSide(color: Color(0x66323438), width: 2),
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: () {

                        if(changeLogin()){
 registrate(context);
                        }
{}                
                         
                        
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
  }
}
