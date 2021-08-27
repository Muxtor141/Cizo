import 'package:cizo/components/cizo_icons_icons.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatefulWidget {
  final int fieldIndex;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final bool isLogin;

  AuthTextField(
      {Key? key,
      required this.isLogin,
      required this.controller,
      required this.formKey,
      required this.fieldIndex})
      : super(key: key);

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  // States start

  bool _isFilled = false;
  Color color = Color(0x1AA9A9A9);
  var decoration1 = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(20),
  );
  TextStyle style = GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xffA9A9A9));

  void changeColor() {
    color = Colors.white;
  }

  void changeBorder() {
    if (widget.controller.text.isNotEmpty) {
      decoration1 = OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(20),
      );
    } else {}
  }

// States end

  List<Map<String, dynamic>> list = [
    {
      "hint": "Enter your full name",
      "icon": AssetImage(
        'assets/icons/person.png',
      ),
    },
    {
      "hint": "Enter your e-mail address",
      "hintLogin": "Enter your e-mail address",
      "icon": AssetImage(
        'assets/icons/mail.png',
      ),
    },
    {
      "hint": "Create account password",
      "hintLogin": "Enter account password",
      "icon": AssetImage(
        'assets/icons/lock.png',
      ),
    }
  ];

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      width: sizeQuery.width * 0.866,
      height: heightQuery * 0.0914,
      child: Form(
          key: widget.formKey,
          child: TextFormField(
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                setState(() {
                  changeColor();
                });

                return "";
              } else {
                setState(() {
                  changeBorder();
                  changeColor();
                });

                return null;
              }
            },
            controller: widget.controller,
            onEditingComplete: () {},
            decoration: InputDecoration(
              hintText: widget.isLogin
                  ? list[widget.fieldIndex]['hintLogin']
                  : list[widget.fieldIndex]['hint'],
              hintStyle: style,
              fillColor: widget.controller.text.isNotEmpty
                  ? Colors.white
                  : Color(0x1AA9A9A9),
              prefixIcon: Container(
                  padding: EdgeInsets.only(top: 17,bottom: 17,left: 20,right:15),
                  child: ImageIcon(list[widget.fieldIndex]['icon'])),
              enabledBorder: decoration1,
             
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
            ),
          )),
    );
  }
}
