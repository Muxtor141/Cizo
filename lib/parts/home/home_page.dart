
import 'package:cizo/parts/home/public_quiz.dart';
import 'package:cizo/parts/home/search.dart';
import 'package:cizo/services/home/search_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    final heightQuery = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
        BlocProvider<SearchUICubit>(create:(c)=>SearchUICubit(),child: HomeSearch()),
          Expanded(
            child: HomePublicQuiz(),
          ),
        ],
      ),
    );
  }
}
