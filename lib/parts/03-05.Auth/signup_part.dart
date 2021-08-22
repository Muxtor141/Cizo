import 'package:cizo/parts/03-05.Auth/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthSignUp extends StatelessWidget {
  AuthSignUp({Key? key}) : super(key: key);

  TextEditingController _cName = TextEditingController();
  TextEditingController _cMail = TextEditingController();
  TextEditingController _cPassword = TextEditingController();

  final _kName = GlobalKey<FormState>();
  final _kMail = GlobalKey<FormState>();
  final _kPassword = GlobalKey<FormState>();

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
      }else{}
    }

    if (validatesIndex==3) {
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
    return Container(
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
                      side: BorderSide(color: Color(0x66323438), width: 5),
                      borderRadius: BorderRadius.circular(20),
                    )),
                onPressed: () {
                  changeButtonState();
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
  }
}
