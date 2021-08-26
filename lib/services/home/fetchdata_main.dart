import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cizo/models/question_model.dart';
import 'package:cizo/models/quizcard_model.dart';
import 'package:cizo/services/home/main_events.dart';

class FetchDataBLoc extends Bloc<HomeEvents, List> {
  FetchDataBLoc() : super([]);

  List<QuizCardModel> cardModels = [];

  List<QuizCardModel> questionModels = [];

  QuizCardModel? getCard(String code) {
    List<dynamic> list1 = cardModels;
     QuizCardModel? item;

    try {
      item = list1.firstWhere(
        (element) => element.quizCode == code,
      );
    } catch (e) {
      if (e == StateError) {
        item = null;
      }
    }

    return item;
  }

  @override
  Stream<List> mapEventToState(HomeEvents event) async* {
    if (event is UpdateCardList) {
      cardModels = await event.getCards();
      yield cardModels;
    }
  }
}

class FetchQuestionBLoc extends Bloc<HomeEvents, List<QuestionModel>> {
  FetchQuestionBLoc() : super([]);

  List<QuestionModel> questionList = [];

  QuestionModel getQuestion(String code) {
    Future.delayed(Duration(milliseconds: 400));
    return questionList.firstWhere((element) => element.code == code);
  }

  int getQuestionTime(String code) {
    QuestionModel item =
        questionList.firstWhere((element) => element.code == code);

    return item.questionTime;
  }

  @override
  Stream<List<QuestionModel>> mapEventToState(HomeEvents event) async* {
    if (event is UpdateQuestionList) {
      questionList = await event.getQuestions();
      yield questionList;
    }
  }
}
