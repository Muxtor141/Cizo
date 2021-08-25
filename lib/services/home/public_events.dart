import 'dart:convert';
import 'dart:io';

import 'package:cizo/models/public_card_model.dart';
import 'package:cizo/models/public_question_model.dart';
import 'package:cizo/models/question_model.dart';
import 'package:cizo/models/quizcard_model.dart';
import 'package:cizo/services/mock_data.dart';
import 'package:http/http.dart' as http;

class PublicEvents {
     final db = MockDataQuizzes();
  Future<List<PublicCardModel>> getCards() async {
  

    // final response = await http.get(Uri.parse("someUrl"));
    // if (response.statusCode == 200) {

    // } else {
    //   throw SocketException('No internet');
    // }
    var response = await db.getPublicCardsList();
    List<dynamic> responseList = jsonDecode(response);
    
    List<PublicCardModel> newList = [];

    for (var cardMap in responseList) {
      var readyCard = PublicCardModel.fromJson(cardMap);
      newList.add(readyCard);
    }

    return newList;
  }

  Future<List<PublicQuestionModel>> getQuestions() async {
 

    // final response = await http.get(Uri.parse("someUrl"));
    // if (response.statusCode == 200) {

    // } else {
    //   throw SocketException('No internet');
    // }
    var response = await db.getPublicQuestionsList();
    List<dynamic> responseList = jsonDecode(response);
    List<PublicQuestionModel> newList = [];
    for (var cardMap in responseList) {
      var readyCard = PublicQuestionModel.fromjson(cardMap);
      responseList.add(readyCard);
    }

    return newList;
  }
}

class UpdatePublicCardList extends PublicEvents{
 
 
}
