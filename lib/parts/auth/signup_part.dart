import 'package:cizo/components/progress_indicator.dart';
import 'package:cizo/parts/04.setup/main.dart';
import 'package:cizo/parts/auth/textfield.dart';
import 'package:cizo/services/auth/auth_bloc.dart';
import 'package:cizo/services/auth/signup_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthSignUp extends StatelessWidget {
  final BuildContext blocContext;
  final bool blocState;
  AuthSignUp({Key? key, required this.blocContext, required this.blocState})
      : super(key: key);

  TextEditingController _cName = TextEditingController();
  TextEditingController _cMail = TextEditingController();
  TextEditingController _cPassword = TextEditingController();

  final _kName = GlobalKey<FormState>();
  final _kMail = GlobalKey<FormState>();
  final _kPassword = GlobalKey<FormState>();
  FirebaseAuth firebase = FirebaseAuth.instance;

  ///STATE RELATED START

  Color buttonColor = Colors.white;

  static TextStyle _style = GoogleFonts.nunitoSans(
      fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xCC323438));

  TextStyle _styleButton = GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w400, fontSize: 18, color: Color(0xffA9A9A9));

  bool changeButtonState() {
    List<GlobalKey<FormState>> list = [_kMail, _kName, _kPassword];
    var validatesIndex = 0;
    for (var e in list) {
      if (e.currentState!.validate() == true) {
        validatesIndex++;
      } else {}
    }

    if (validatesIndex == 3) {
      buttonColor = Color(0xff14C1FA);
      _styleButton = GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white);
      return true;
    } else {
      _styleButton = GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w700, fontSize: 18, color: Color(0xffA9A9A9));
      buttonColor = Colors.white;
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
    blocContext
        .read<AuthBloc>()
        .add(SignUp("muxtor1411@gmail.com", "_cPassword.text"));
  }

  final auth = Authentication();

//STATE RELATED END
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
        builder: (context1, snapshot) {
          Widget body = Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Full Name', style: _style),
                  ],
                ),
                topSpace,
                AuthTextField(
                  isLogin: false,
                  fieldIndex: 0,
                  controller: _cName,
                  formKey: _kName,
                ),
                botSpace,
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
                    isLogin: false,
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
                    isLogin: false,
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
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Color(0x66323438), width: 5),
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: () async {
                        registrate(context1);
                      },
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: _styleButton,
                        ),
                      )),
                )
              ],
            ),
          );
          if (snapshot.hasError) {
            return AbsorbPointer(
              child: body,
              absorbing: false,
            );
          } else if (snapshot.hasData) {

             FirebaseAuth.instance
  .userChanges()
  .listen((User? user) {
    if (user == null) {

      print('User is currently signed out!');
    } else if(user.email=="muxtor1411@gmail.com") {
        Navigator.of(context).pushNamed("profileSetup",arguments: ProfileArguments(true));
      print('User is signed in!');
    }
  });
  
            return  Container(
                  child: body,
                );
          } else {
            return AbsorbPointer(
              child: body,
              absorbing: false,
            );
          }
        });
  }
}
