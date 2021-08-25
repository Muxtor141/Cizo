import 'dart:convert';
import 'dart:io';

import 'package:cizo/models/question_model.dart';
import 'package:cizo/models/quizcard_model.dart';
import 'package:cizo/services/mock_data.dart';
import 'package:http/http.dart' as http;

class HomeEvents {
  Future<List<QuizCardModel>> getCards() async {
    final db = MockDataQuizzes();

    // final response = await http.get(Uri.parse("someUrl"));
    // if (response.statusCode == 200) {

    // } else {
    //   throw SocketException('No internet');
    // }
    var response = await db.getCardsList();
    List<dynamic> responseList = jsonDecode(response);
    
    List<QuizCardModel> newList = [];

    for (var cardMap in responseList) {
      var readyCard = QuizCardModel.fromJson(cardMap);
      newList.add(readyCard);
    }

    return newList;
  }

  Future<List<QuestionModel>> getQuestions() async {
    final db = MockDataQuizzes();

    // final response = await http.get(Uri.parse("someUrl"));
    // if (response.statusCode == 200) {

    // } else {
    //   throw SocketException('No internet');
    // }
    var response = await db.getQuestionsList();
    List<dynamic> responseList = jsonDecode(response);
    List<QuestionModel> newList = [];
    for (var cardMap in responseList) {
      var readyCard = QuestionModel.fromjson(cardMap);
      newList.add(readyCard);
    }

    return newList;
  }
}

class UpdateCardList extends HomeEvents {
  void update(String code ){}
 
 

}
class UpdateQuestionList extends HomeEvents {
 
}
