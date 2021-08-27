import 'dart:async';

import 'package:cizo/services/setup/select_country.dart';
import 'package:cizo/services/setup/selected_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CountriesListPage extends StatefulWidget {
  CountriesListPage({Key? key}) : super(key: key);

  @override
  _CountriesListPageState createState() => _CountriesListPageState();
}

class _CountriesListPageState extends State<CountriesListPage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SelectCountry, List>(
          builder: (blocContext, blocState) {
            return Column(
              children: [
                SizedBox(
                  height: heightQuery * 0.0615,
                ),
                Container(
                  height: heightQuery * 0.0665,
                  width: sizeQuery.width * 0.866,
                  child: TextFormField(
                    onChanged: (String text) {
                      print('${text} changed');
                      blocContext.read<SelectCountry>().sortList(text);
                    },
                    onEditingComplete: () {},
                    controller: _controller,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.search)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                SizedBox(
                  height: heightQuery * 0.03,
                ),
                BlocBuilder<SelectedCountryCubit, String>(
                  builder: (cubitContext, cubitState) {
                    return Expanded(
                        child: blocState.isNotEmpty
                            ? Scrollbar(
                                thickness: 5,
                                child: ListView.builder(
                                    itemCount: blocState.length,
                                    itemBuilder: (c, index) {
                                      return Container(
                                        height: heightQuery * 0.0862,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 10.0),
                                                  blurRadius: 77.87,
                                                  color: Color(0XFFC5C5C5)
                                                      .withOpacity(0.2))
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, bottom: 10),
                                        child: TextButton(
                                          onPressed: () {
                                            cubitContext
                                                .read<SelectedCountryCubit>()
                                                .updateCountry(
                                                    blocState[index]);
                                            Timer(Duration(milliseconds: 100),
                                                () {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              blocState[index]
                                                  .split('')
                                                  .join(" "),
                                              style: GoogleFonts.nunitoSans(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18,
                                                  color: Color(0xff323438)),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              ));
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
